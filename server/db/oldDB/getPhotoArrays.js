const fs = require('fs');
const path = require('path');

const buildUserPhotos = function buildUserPhotos() {
  return new Promise((resolve, reject) => {
    fs.readdir(path.join(__dirname, '../../', 'images', 'small'), { encoding: 'utf8' }, (error, data) => {
      if (error) {
        reject(error);
      } else {
        resolve(Promise.all(data.map(img => `https://s3.amazonaws.com/airbnbcloneuserphotos/${img}`)))
      }
    });
  });
};

const buildRoomsPhotos = function buildRoomsPhotos() {
  return new Promise((resolve, reject) => {
    fs.readdir(path.join(__dirname, '../../', 'images', 'rooms'), { encoding: 'utf8' }, (error, data) => {
      if (error) {
        reject(error);
      } else {
        resolve(Promise.all(data.map(img => `https://s3.amazonaws.com/airbnbclonerooms/${img}`)))
      }
    });
  });
};

const buildListingPhotos = function buildListingPhotos() {
  return new Promise((resolve, reject) => {
    fs.readdir(path.join(__dirname, '../../', 'images', 'interiorsFixed'), { encoding: 'utf8' }, (error, data) => {
      if (error) {
        reject(error);
      } else {
        resolve(Promise.all(data.map(img => `https://s3.amazonaws.com/airbnbcloneinteriorphotos/${img}`)))
      }
    });
  });
};

// buildUserPhotos().then(console.log)

buildRoomsPhotos().then(console.log)

// buildListingPhotos().then(console.log)
