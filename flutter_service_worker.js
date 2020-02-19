'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "8ceff1832f13e09c64468faba7daa850",
"/main.dart.js": "e650e316e134390d48d4d0f79e76c006",
"/assets/LICENSE": "c49010c564ac5d3b18cfab6088d113aa",
"/assets/AssetManifest.json": "32d8929057890a2a67ffd9f82157ae1b",
"/assets/FontManifest.json": "f7161631e25fbd47f3180eae84053a51",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/logo.svg": "db8d25fd045464f00e1007d6122c6dc9"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
