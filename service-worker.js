self.addEventListener('install', e => {
  e.waitUntil(
    caches.open('deimon-cache').then(cache => {
      return cache.addAll([
        'dashboard-deimon.html',
        'manifest.json',
        'deimon-icon.png'
      ]);
    })
  );
});

self.addEventListener('fetch', e => {
  e.respondWith(
    caches.match(e.request).then(response => response || fetch(e.request))
  );
});
