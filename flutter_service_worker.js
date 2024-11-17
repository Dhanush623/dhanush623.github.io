'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "f393d3c16b631f36852323de8e583132",
"main.dart.js": "32272b345fad0794f034de27b9fc142b",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/AssetManifest.bin": "8a59bc412079d6c13b039888e3a9d2f5",
"assets/fonts/MaterialIcons-Regular.otf": "1b3895b63556baa57e29045498e1fffb",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "893779adf361c651acdf8f8af5d76f94",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "46de9c87570f072eca5d8fdee616465f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "bf21cd8fd775a3c59fd53afdee39e0e6",
"assets/assets/svg/icons8-html-5.svg": "a0657d1cac3b20f1e113738056db3c63",
"assets/assets/svg/icons8-ionic.svg": "01d4436b2100f3d4115adeb6f8488ff5",
"assets/assets/svg/icons8-git.svg": "5eed2c8cb62e1adfae09b0129a25a1a7",
"assets/assets/svg/icons8-javascript.svg": "8ee02715beb101d7d505a9473bfb2754",
"assets/assets/svg/icons8-linkedin.svg": "2c20928ddc18c3e2ac70e6f8f38ca825",
"assets/assets/svg/icons8-css3.svg": "d10f4bf68a27526ef83fd9dfdc75317d",
"assets/assets/svg/icons8-redis.svg": "98b2cfe5c649b71347ebf2e8e8ea0d90",
"assets/assets/svg/icons8-flutter.svg": "92199e1295daa401a178e23bcfc438c8",
"assets/assets/svg/icons8-kotlin.svg": "94e0a77ea6158d72c09683facdc057f5",
"assets/assets/svg/icons8-google-firebase.svg": "12c51693d5a8b2e0043edbbabba2b13a",
"assets/assets/svg/ktor-seeklogo.svg": "a6e00d9d0b17610bd6b93babc563c577",
"assets/assets/svg/icons8-react-native.svg": "a899d525422ddb1c9b5bc595ec6da942",
"assets/assets/svg/icons8-elasticsearch.svg": "a2ecbef187cc7d5ff3dfe878cd0ef88b",
"assets/assets/svg/icons8-typescript.svg": "5993eb478920a0f7b27c3ab9cc16cd6f",
"assets/assets/icons/my_works/totodo_icon.png": "dfd3630db31531eaee84f4721752a3bd",
"assets/assets/icons/my_works/fincalc_icon.png": "cfb66665cd178f642f5f17ab673a9d84",
"assets/NOTICES": "ede35f931bece8aeccac3db407c49013",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "044dc2d3a9c97b366d8dbc4792a5d524",
"assets/AssetManifest.bin.json": "e03680276abd84afd8d249b356a50ff2",
"index.html": "3205c0b347eb5f3d07561e95abe33af8",
"/": "3205c0b347eb5f3d07561e95abe33af8",
"manifest.json": "fce5a553e8e5904e9f757214cbbfbb1a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"icons/Icon-maskable-192.png": "456e69aca0e042ef80a1e64ad212918a",
"icons/Icon-192.png": "456e69aca0e042ef80a1e64ad212918a",
"icons/Icon-512.png": "c8033a580ada290ed9e8a654973a854d",
"icons/Icon-maskable-512.png": "c8033a580ada290ed9e8a654973a854d",
"favicon.png": "602fd08adfb7d8313f75d622d53753d6",
"version.json": "009c9e65172e010890f7f65fde438006",
"flutter_bootstrap.js": "0642c09292239d5e15650ff728ba443a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
