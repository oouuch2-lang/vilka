// Network first so updates arrive at once; the cached copy keeps the calculator working offline.
self.addEventListener('install', e => { e.waitUntil(caches.open('vilka').then(c => c.add('./'))); self.skipWaiting(); });
self.addEventListener('activate', e => e.waitUntil(self.clients.claim()));
self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET' || !e.request.url.startsWith(self.location.origin)) return;
  e.respondWith(fetch(e.request)
    .then(r => { if (!r.ok) return r; const copy = r.clone(); caches.open('vilka').then(c => c.put(e.request, copy)); return r; })
    .catch(() => caches.match(e.request, { ignoreSearch: true }).then(r => r || caches.match('./'))));
});
