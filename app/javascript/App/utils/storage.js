export const setToLS = (key, value) => {
    window.localStorage.setItem(key, JSON.stringify(value));
    window.location.reload(false);
  }
  
export const getFromLS = key => {
  const value = window.localStorage.getItem(key);

  if (value) {
    return JSON.parse(value);
  }
}
