// var n = 10;
// var step = 10;
//
// //Bg gradient
//
// var canvas = document.createElement('canvas');
// canvas.width = 32;
// canvas.height = window.innerHeight;
//
// var context = canvas.getContext('2d');
//
// var gradient = context.createLinearGradient(0, 0, 0, canvas.height);
// gradient.addColorStop(0, "#1e4877");
// gradient.addColorStop(0.5, "#4584b4");
//
// context.fillStyle = gradient;
// context.fillRect(0, 0, canvas.width, canvas.height);
//
// document.body.style.background = 'url(' + canvas.toDataURL('image/png') + ')';

// Clouds

var container;
var camera, scene, renderer, sky, mesh, geometry, material,
  i, h, color, colors = [],
  sprite, size, x, y, z;

var target = new THREE.Vector3(0, 0, 0);

var mouseX = 0,
  mouseY = 0;
var start_time = new Date().getTime();

var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;

init();
animate();

function init() {

  // dom
  container = document.createElement('div');
  document.body.appendChild(container);

  // renderer
  renderer = new THREE.WebGLRenderer({
    antialias: false
  });
  renderer.setSize(window.innerWidth, window.innerHeight);
  renderer.setClearColor(0xffffff, 1);

  $(renderer.domElement).css({
    position: 'fixed',
    bottom: 0,
    left: 0,
    zIndex: -2
  });
  container.appendChild(renderer.domElement);

  // scene
  scene = new THREE.Scene();

  // camera
  camera = new THREE.PerspectiveCamera(30, window.innerWidth / window.innerHeight, 1, 10000);
  camera.position.z = 6000; // reset later

  // texture image
  var texture = THREE.ImageUtils.loadTexture('/images/cloud10.png');
  texture.magFilter = THREE.LinearMipMapLinearFilter;
  texture.minFilter = THREE.LinearMipMapLinearFilter;

  // shader material for a layer
  material = new THREE.ShaderMaterial({
    uniforms: {
      "map": {
        type: "t",
        value: texture
      }
    },
    vertexShader: document.getElementById('vs').textContent,
    fragmentShader: document.getElementById('fs').textContent,
    depthTest: false,
    transparent: true

  });

  // plane template
  var plane = new THREE.Mesh(new THREE.PlaneGeometry(64, 64));

  // geometry layers
  geometry = new THREE.Geometry();
  for (i = 0; i < 8000; i++) {

    plane.position.x = Math.random() * 1000 - 500;
    plane.position.y = -Math.random() * Math.random() * 200 - 15;
    plane.position.z = i;
    plane.rotation.z = Math.random() * Math.PI;
    plane.scale.x = plane.scale.y = Math.random() * Math.random() * 1.5 + 0.5;

    plane.updateMatrix();
    geometry.merge(plane.geometry, plane.matrix);

  }

  //mesh
  mesh = new THREE.Mesh(geometry, material);
  scene.add(mesh);

  // listeners
  //document.addEventListener('mousemove', onDocumentMouseMove, false);
  window.addEventListener('resize', onWindowResize, false);

}

function onDocumentMouseMove(event) {

  mouseX = (event.clientX - windowHalfX) * 0.25;
  mouseY = (event.clientY - windowHalfY) * 0.15;

}

function onWindowResize(event) {

  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();

  renderer.setSize(window.innerWidth, window.innerHeight);

}

function animate() {

  requestAnimationFrame(animate);
  render();

}

function render() {

  // distance along z-axis
  var position = ((new Date().getTime() - start_time) * 0.03) % 8000;

  // camera pos
  camera.position.x += (mouseX - target.x) * 0.01;
  camera.position.y += (-mouseY - target.y) * 0.01;
  camera.position.z = -position + 8000; // moving down z-axis

  // target pos
  target.x = camera.position.x;
  target.y = camera.position.y;
  target.z = camera.position.z - 1000;

  // hey, lookey
  camera.lookAt(target);

  // render
  renderer.render(scene, camera);

}
