//se crea una constante y se requiere 'Express'
const express = require('express');
//se crean las contantes para el login, personal y productos
//que obtienen las funciones de cada JS 
const LoginController = require('../controllers/LoginController');
const persController = require('../controllers/personalController');
const productosController = require('../controllers/productosController');
const reportesController = require('../controllers/reportesController');

const router = express.Router();

//Define las rutas que tendran
router.get('/login', LoginController.index);
router.get('/register', LoginController.register);
router.post('/register', LoginController.storeUser);
router.post('/login', LoginController.auth);
router.get('/logout', LoginController.logout);
router.get('/personal', LoginController.personal);

router.get('/pers', persController.index);
router.get('/create', persController.create);
router.post('/create', persController.store);
router.post('/pers/delete', persController.destroy);
router.get('/pers/edit/:id', persController.edit);
router.post('/pers/edit/:id', persController.update);
router.post('/pers/buscar', persController.buscar);


router.get('/productos', productosController.indexp);
router.get('/createprod', productosController.create);
router.post('/createprod', productosController.store);
router.post('/productos/delete', productosController.destroy);
router.get('/productos/editprod/:id', productosController.edit);
router.post('/productos/editprod/:id', productosController.update);
router.post('/productos/productos/buscar', productosController.buscar);


router.post('/rep-venta_d', reportesController.venta_dia);
router.post('/rep-venta_p', reportesController.venta_periodo);
router.post('/rep-trabajador_d', reportesController.trabajador_dia);
router.post('/rep-trabajador_p', reportesController.trabajador_periodo);
router.post('/rep-producto_d', reportesController.producto_dia);
router.post('/rep-producto_p', reportesController.producto_periodo);
router.post('/rep-detalle_d', reportesController.detalle_dia);
router.post('/rep-detalle_p', reportesController.detalle_periodo);
router.get('/c-rep-venta', reportesController.createreporteventa);
router.get('/c-rep-detalle', reportesController.createreportedetalle);
router.get('/c-rep-trabajador', reportesController.createreportetrabajador);
router.get('/c-rep-producto', reportesController.createreporteproducto);
//Exporta las rutas 
module.exports = router;
