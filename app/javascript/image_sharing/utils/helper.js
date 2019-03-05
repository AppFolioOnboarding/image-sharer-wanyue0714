import 'whatwg-fetch';

const HEADERS = {
  Accept: 'application/json',
  'Content-Type': 'application/json',
  'X-Requested-With': 'XMLHttpRequest' // make backwards compatible with rails "request.xhr?"
};

function getCsrfToken() {
  const meta = document.querySelector('meta[name="csrf-token"]');
  return meta ? meta.getAttribute('content') : '';
}

/**
 * Build a query string from an object
 */
export function serialize(obj, prefix) {
  const parts = [];
  Object.keys(obj).forEach(key => {
    if (obj[key] !== undefined && obj[key] !== null) {
      const param = prefix ? `${prefix}[${key}]` : key;
      const value = obj[key];

      if (typeof(value) === 'object') {
        parts.push(serialize(value, param));
      } else {
        parts.push(`${encodeURIComponent(param)}=${encodeURIComponent(value)}`);
      }
    }
  });
  return parts.join('&');
}

/**
 * Checks the response code of an HTTP response.
 * For 200 responses a Promise for the JSON is returned.  Otherwise an error is thrown
 */
function checkResponseStatus(res) {
  const status = res.status;
  if (status === 204) {
    return Promise.resolve(); // No content
  } else if (status === 302) {
    window.location.reload();
    return Promise.reject();
  } else if (status === 401 || status === 403) {
    window.location.reload();
    return Promise.reject();
  } else if (status < 200 || status >= 300) {
    return res
      .text()
      .then(text => {
        let data;
        try { data = JSON.parse(text); } catch (e) {} // eslint-disable-line no-empty
        const error = new Error(!data && text || res.statusText);
        error.data = data;
        throw error;
      });
  }
  return res.json();
}

/**
 * Perform an HTTP POST to the API and parse the response as JSON
 */
export function post(path, body) {
  return fetch(path, {
    body: JSON.stringify(body),
    credentials: 'same-origin',
    headers: Object.assign({ 'X-CSRF-Token': getCsrfToken() }, HEADERS),
    method: 'POST',
    redirect: 'error',
  }).then(checkResponseStatus);
}
