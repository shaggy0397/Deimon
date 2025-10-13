// Define el nombre y la versión de la caché
const CACHE_NAME = 'deimon-cache-v1';

// Lista de archivos que se deben cachear (el "App Shell")
const urlsToCache = [
  '/',
  'index.html'
  // Nota: Los recursos externos como Google Fonts o CDNs de Tailwind
  // se cachearán por el navegador automáticamente. Este service worker
  // se enfoca en hacer que tu aplicación principal cargue sin conexión.
];

// Evento 'install': Se dispara cuando el Service Worker se instala por primera vez.
self.addEventListener('install', event => {
  // Espera hasta que la promesa dentro de waitUntil se resuelva
  event.waitUntil(
    // Abre la caché con el nombre que definimos
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Cache abierta');
        // Agrega todos los archivos de nuestra lista a la caché
        return cache.addAll(urlsToCache);
      })
  );
});

// Evento 'fetch': Se dispara cada vez que la página realiza una solicitud de red (p. ej., para un archivo, una imagen, etc.)
self.addEventListener('fetch', event => {
  event.respondWith(
    // Busca si la solicitud ya existe en nuestra caché
    caches.match(event.request)
      .then(response => {
        // Si encontramos una respuesta en la caché...
        if (response) {
          // ...la devolvemos directamente, sin ir a la red.
          return response;
        }
        // Si no está en la caché, procedemos a hacer la solicitud a la red.
        return fetch(event.request);
      }
    )
  );
});

// Evento 'activate': Se dispara cuando un nuevo Service Worker se activa.
// Es útil para limpiar cachés antiguas que ya no se usan.
self.addEventListener('activate', event => {
  const cacheWhitelist = [CACHE_NAME];
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          // Si una caché existente no está en nuestra "lista blanca", la eliminamos.
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

