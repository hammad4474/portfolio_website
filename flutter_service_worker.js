'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "994ac2bf63144f7c8b9e8d6ad551f1f4",
"assets/AssetManifest.bin.json": "7fce8fa71c4056385453ca8f785d05b0",
"assets/AssetManifest.json": "e9895504fb84c9a801700321bc052f75",
"assets/assets/fonts/Poppins-Bold.ttf": "92934d92f57e49fc6f61075c2aeb7689",
"assets/assets/fonts/Poppins-Medium.ttf": "20aaac2ef92cddeb0f12e67a443b0b9f",
"assets/assets/fonts/Poppins-Regular.ttf": "09acac7457bdcf80af5cc3d1116208c5",
"assets/assets/fonts/Poppins-SemiBold.ttf": "2c63e05091c7d89f6149c274971c7c23",
"assets/assets/images/2Let.png": "e98f1c46c0d5d788d384b4d0f65fdde4",
"assets/assets/images/alarm-clock.png": "cdf8a7465263bc11f60a399a40d71b04",
"assets/assets/images/car-rentel.png": "7ef93e883cf7d270ce37d5d7958107e0",
"assets/assets/images/eye-doctor-pro.png": "e257475c0ff7fb402e765ceb9023074e",
"assets/assets/images/fitness.png": "c32c3f14fbc6050e6d9a928f06bc0b4e",
"assets/assets/images/icons/android.png": "afa00d9f7379ecef3557d52d09488efe",
"assets/assets/images/icons/android.svg": "3f0a9233bf0d7d9a02e0f08b94bce2cd",
"assets/assets/images/icons/css.png": "19502628a643f4cafa57e7eadac4ee64",
"assets/assets/images/icons/css.svg": "a55118403c13e2719d453b74dffa80f8",
"assets/assets/images/icons/dart.png": "2e0719b33b5cdd1ece46611b4d3d4a81",
"assets/assets/images/icons/dart.svg": "11b770f163584b0e8cbba1f7bc626f55",
"assets/assets/images/icons/firebase.png": "cf0918b3d77d6e4505a65f103e5f3382",
"assets/assets/images/icons/firebase.svg": "60c0ed1d65b8e895d80aa57b8b7ad09c",
"assets/assets/images/icons/flutter.png": "23ded1e93189e77c12bda66ca4274d08",
"assets/assets/images/icons/flutter.svg": "5ff1722cbed36fdb869cba0c95788d42",
"assets/assets/images/icons/github.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/images/icons/github.svg": "f597ed70ffdeb7b44e8c31e3af30097e",
"assets/assets/images/icons/html.png": "f6ff1a4851e1797c3671bd1d426b4748",
"assets/assets/images/icons/html.svg": "16d07e8682a531f3bc1e9fb01bd59740",
"assets/assets/images/icons/ios.png": "2f803da6dffb63980ffdb22c6610248b",
"assets/assets/images/icons/ios.svg": "ac3c720b5dc63c2a83ce3f35ec636d0c",
"assets/assets/images/icons/linkedin.png": "30c453b7f5fbdb09ea0cb42a5dc7a6e5",
"assets/assets/images/icons/linkedin.svg": "70dc58b32d15cecedb86a6145c03ada1",
"assets/assets/images/icons/mongodb.png": "071f8e57bdd1fe45a37a5b8a8684773f",
"assets/assets/images/icons/mongodb.svg": "8aad4da2ed641d2378923f85fe35189d",
"assets/assets/images/icons/nodejs.png": "1a076c62bca20cee6a8d962e8cd74906",
"assets/assets/images/icons/nodejs.svg": "19f661d0537a79acbcb13829537c2930",
"assets/assets/images/icons/restapi.png": "50c7dc7819a6d9895de4c1261899ae40",
"assets/assets/images/icons/restapi.svg": "d03cfdfb3610f9cdbb7254be0d8e039a",
"assets/assets/images/icons/vercel.png": "f2f453dca4911ad8ce23ddc53ba24ddc",
"assets/assets/images/icons/vercel.svg": "6be0f20074d6de10badf596a1d406e8f",
"assets/assets/images/icons/whatsapp.png": "84cbca38b8240b2ce2745e9d4f360faa",
"assets/assets/images/image.png": "e044f7c8f105c26480a371400a13b3c9",
"assets/assets/images/weather_app.png": "d65681cf95e88bbbf8c0ee46b6997dff",
"assets/FontManifest.json": "ef877ba6966680aa6456b66035f22348",
"assets/fonts/MaterialIcons-Regular.otf": "7a0f18dd8431abb88c04a7f226c0e219",
"assets/NOTICES": "0bf72faf7c7ac7c9b890da5fd1860725",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "37d638735ef25e5f11e9d734cca761a6",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ca42a21897abf2725eb2691883ff5bf6",
"/": "ca42a21897abf2725eb2691883ff5bf6",
"main.dart.js": "094e539b7a72fc53855dad14fdf5ab48",
"manifest.json": "9583ebe54188295a4768ae1aa040030b",
"version.json": "cc1fa9cce5af273c0909d105387fee89"};
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
