-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 30-11-2023 a las 04:44:43
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema3bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `tipo_art` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`tipo_art`, `descripcion`) VALUES
(1, 'venta directa'),
(2, 'preparado'),
(3, 'insumo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_producto`, `cantidad`, `email`, `precio`) VALUES
(52, 1, '21301061550127@cetis155.edu.mx', 20),
(58, 1, '21301061550127@cetis155.edu.mx', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `folio` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`folio`, `id_producto`, `cantidad`, `precio`, `name`) VALUES
(1, 20, 2, 45, 'Coca Cola 3L'),
(2, 48, 1, 25, 'Bionicos'),
(2, 64, 2, 38, 'Torta ahogada'),
(3, 28, 4, 46, 'Mamut'),
(4, 65, 7, 2, 'Trident uva'),
(5, 80, 1, 35, 'Triki Trakers'),
(104, 2, 2, 16, 'Agua ciel 1L'),
(108, 16, 1, 12, 'Yogurt'),
(109, 45, 2, 20, 'Sprite'),
(110, 33, 9, 5, 'Paleta de la rosa'),
(111, 42, 4, 13, 'Panditas'),
(112, 64, 1, 38, 'Torta ahogada'),
(113, 72, 5, 17, 'Ruffles Queso'),
(114, 34, 1, 10, 'Lucas Muecas'),
(115, 1, 1, 19, 'Agua ciel 1.5L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `folio` int(11) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  `id_status` int(11) NOT NULL,
  `corre_emp` varchar(200) DEFAULT NULL,
  `correo_clie` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`folio`, `fecha`, `id_status`, `corre_emp`, `correo_clie`) VALUES
(1, '2023-11-21', 5, 'cocina@gmail.com', '21301061550124@cetis155.edu.mx'),
(2, '2023-11-22', 5, 'cocina@gmail.com', '21301061550127@cetis155.edu.mx'),
(3, '2023-10-18', 1, NULL, '21301061550124@cetis155.edu.mx'),
(4, '2023-11-16', 1, NULL, '21301061550124@cetis155.edu.mx'),
(5, '2023-11-13', 1, NULL, '21301061550124@cetis155.edu.mx'),
(104, '2023-10-25', 1, NULL, '21301061550127@cetis155.edu.mx'),
(108, '2023-08-22', 1, NULL, '21301061550124@cetis155.edu.mx'),
(109, '2023-11-15', 1, NULL, '21301061550124@cetis155.edu.mx'),
(110, '2023-10-20', 1, NULL, '21301061550114@cetis155.edu.mx'),
(111, '2023-11-22', 1, NULL, '21301061550135@cetis155.edu.mx'),
(112, '2023-11-23', 1, NULL, '21301061550128@cetis155.edu.mx'),
(113, '2023-12-29', 1, NULL, '21301061550124@cetis155.edu.mx'),
(114, '2023-12-21', 1, NULL, '21301061550124@cetis155.edu.mx'),
(115, '2023-11-23', 1, NULL, '21301061550127@cetis155.edu.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id_producto` int(11) NOT NULL,
  `unidad` int(11) NOT NULL,
  `tipo_art` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `costo` float NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id_producto`, `unidad`, `tipo_art`, `name`, `precio`, `costo`, `imagen`) VALUES
(1, 2, 1, 'Agua ciel 1.5L', 19, 9, 'https://cdn.alsuper.com/products/297320_p.png'),
(2, 2, 1, 'Agua ciel 1L', 16, 8, 'https://alsuper.online/products/359811_p.png'),
(3, 4, 3, 'Pan Dulce', 12, 8, 'https://farmaciacalderon.com/cdn/shop/products/100785_580x.png?v=1637273350'),
(8, 4, 2, 'Torta de Carnitas', 35, 17, 'https://store.loscorrales.com.mx/cdn/shop/products/ARACHERA150px-01_1200x1200.png?v=1590610077'),
(9, 2, 1, 'Santa Clara ', 12, 6, 'https://www.coca-cola.com.mx/content/dam/one/mx/es/products/santa-clara/saborizadas/Sabor_Chocolate_180ml.png'),
(10, 2, 1, 'Tikito', 6, 3, 'http://integrattodev.cloudapp.net/selloRojoAdmin/uploads/presentaciones/imagenes/61e8327b3aec0f401086daf3a8a4975b.png'),
(11, 2, 1, 'Arizona', 20, 12, 'https://static.wixstatic.com/media/458b8d_8f52ccf63d414125aa95b1dade522a9c.png/v1/fit/w_500,h_500,q_90/file.png'),
(13, 4, 2, 'Flautas', 35, 17, 'https://elpasoflauta.com/wp-content/uploads/2022/05/The-El-Paso-Flauta-04-cropped.png'),
(15, 1, 1, 'Galletas Prin', 19, 14, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvTJnAO3b1ym4eKVW_b5IBMmIceveGLi2-2Q&usqp=CAU'),
(16, 2, 1, 'Yogurt', 12, 5, 'https://www.lala.com.mx/storage/app/media/Prodcutos/7501020561159.png'),
(17, 2, 1, 'Frutsi', 10, 5, 'https://farmaciacalderon.com/cdn/shop/products/75001988_580x.png?v=1605547188'),
(18, 4, 2, 'Torta Adobada', 12, 35, 'https://store.loscorrales.com.mx/cdn/shop/products/ADOBADA2150px-01_2048x2048.png?v=1590855675https://torterialaley.laminiatura.mx/images/melchori-entrada.png'),
(19, 4, 2, 'Hot Dog', 15, 30, 'https://static.vecteezy.com/system/resources/thumbnails/025/063/648/small/hotdog-with-ai-generated-free-png.png'),
(20, 2, 1, 'Coca Cola 3L', 45, 35, 'https://static.wixstatic.com/media/8bf8c7_1d322df382b54e7085a30bb724d39fd0~mv2.png/v1/fit/w_500,h_500,q_90/file.png'),
(21, 4, 1, 'Paleta Twister', 20, 13, 'https://lanzadera.es/wp-content/uploads/2019/08/pirulo_tropical-249x300.png'),
(23, 4, 2, 'Bolillo guisado', 25, 12, 'https://www.acalastortas.com.mx/wp-content/uploads/2017/06/torta-yucateca-png.png'),
(24, 2, 1, 'Coca-cola', 20, 10, 'https://www.yokiro.com.mx/yokiro/assets/img/productos/181_1.pnghttps://grupodjes.com/wp-content/uploads/2022/11/coca_600_ml-removebg-preview.png'),
(26, 2, 1, 'Jumex', 18, 9, 'https://chefmart.com.mx/cdn/shop/products/BOTELLAmango450ML_1600x.png?v=1630944211'),
(27, 2, 1, 'Jugo del valle ', 18, 9, 'https://www.lasmamis.mx/Mamis2/complementos/uploads/articulos/8.png?var=2'),
(28, 1, 1, 'Magnum', 46, 32, 'https://tienda.lahuerta.com.mx/cdn/shop/products/Magnum_clasica.png?v=1677557183&width=1445'),
(29, 1, 1, 'Gansito', 15, 7, 'https://cdn.shopify.com/s/files/1/0566/4391/1854/products/7501000153107.png?v=1626777432'),
(30, 4, 1, 'Donas', 12, 6, 'https://alsuper.online/products/404724_p.png'),
(31, 4, 3, 'Churros', 10, 5, 'https://images.rawpixel.com/image_transparent_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTEyL2ZyZGFyaWF5YWtvdmxldmEwMDExNi1pbWFnZS1qb2IxNTI3LnBuZw.png'),
(32, 4, 2, 'Carlota', 25, 12, 'https://i.pinimg.com/originals/51/b1/f5/51b1f5c6fcef26341fb8c0b035c4c33c.png'),
(33, 4, 1, 'Paleta de la rosa', 5, 2, 'https://tiendadelarosa.com/cdn/shop/products/Disenosintitulo-2022-05-20T125800.138.png?v=1653069537'),
(34, 4, 1, 'Lucas Muecas', 10, 5, 'https://www.lucas.com.mx/sites/g/files/fnmzdf1681/files/migrate-product-files/ycfe0zr5gatyjl3lbdai.png'),
(35, 4, 2, 'Burrito', 20, 10, 'https://png.pngtree.com/png-clipart/20211010/original/pngtree-taco-vegetable-diet-fast-food-baking-png-image_6850786.png'),
(36, 2, 1, 'Frapuccino', 18, 9, 'https://images.gopuff.com/blob/gopuffcatalogstorageprod/catalog-images-container/resize/cf/version=1_0,format=auto,fit=scale-down,width=800,height=800/36177b88-1939-4ccb-a6a6-782d1c468105.png'),
(37, 4, 1, 'Paleta hielo', 15, 7, 'https://www.paletaselfeo.com/wp-content/uploads/2021/03/88.png'),
(38, 4, 1, 'Mangonada', 15, 7, 'https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.latam/files/BK_Web_SMOOTHIEMANGOTROPICAL_500X540px.png'),
(39, 4, 2, 'Torta jamón', 25, 12, 'https://file.adomicil.io/castellana.adomicil.io/_files/images/division/large/jamonserrano-07740880319728.png'),
(40, 1, 1, 'Cacahuate ga.', 13, 6, 'https://www.superaki.mx/cdn/shop/products/0000000003218_52c98ecd-e0b2-440b-915a-fb3a812dc698_300x300.png?v=1626652448'),
(41, 1, 1, 'Krankys', 13, 6, 'https://tienda.farmaciasroma.com/media/catalog/product/cache/8cfc93e6196efd5c8964fe64a59d97bb/4/4/4432998ace793dc244ca9c1348defb2c_757528042011-1.png'),
(42, 1, 1, 'Panditas', 13, 6, 'https://dulcesbalu.mx/cdn/shop/products/Super-Dulces-min-panditas-1-kilo-frente.png?v=1677257304'),
(43, 2, 1, 'Agua ciel limón', 13, 6, 'https://tienda.farmaciasroma.com/media/catalog/product/cache/8cfc93e6196efd5c8964fe64a59d97bb/2/6/265790452160d48f3477d77c5b00c8a0_7501055352463-1.png'),
(44, 3, 1, 'Brownies', 12, 6, 'https://www.terecazola.com/wp-content/uploads/2017/03/browniesconazucar-2.png'),
(45, 4, 1, 'Palomitas', 16, 8, 'https://cdn.uey.mx/uploads/Grupo18-Mix-palomitas.png.webp'),
(46, 4, 2, 'Rollo sushi', 25, 12, 'https://file.adomicil.io/teikit.tr3sco.net/_files/images/division/makis-california-00605706740452771.png'),
(47, 4, 1, 'Cubrebocas', 5, 2, 'https://www.bhp.com.mx/hubfs/Sitio_web/productos/con-tabla/cubre-bocas/cubre-bocas-sencillo.png'),
(48, 5, 2, 'Bionicos', 25, 12, 'https://i.pinimg.com/originals/46/a7/89/46a789d219162d3a11fa5b2ab21f65b0.png'),
(49, 4, 2, 'Tacos guisado', 15, 7, 'https://www.pitchme1.com/wp-content/uploads/2021/03/1TacosDeGuisado-LaBanqueta.png'),
(50, 2, 2, 'Sprite', 20, 10, 'https://alsuper.online/products/319639_p.png'),
(51, 2, 1, 'Manzanita', 20, 10, 'https://modeloramanow.vtexassets.com/arquivos/ids/155447/51.png?v=637349320009530000'),
(52, 2, 1, 'Fanta de fresa', 20, 10, 'https://alsuper.online/products/244266_p.png'),
(54, 2, 1, 'Delaware punch', 20, 10, 'https://www.yokiro.com.mx/yokiro/assets/img/productos/586_1.png'),
(55, 2, 1, 'Limonada', 20, 10, 'https://store.loscorrales.com.mx/cdn/shop/products/LIMON1-01_7e095ce4-6237-476e-b7fd-1a068b29920e_1200x1200.jpg?v=1624374291'),
(56, 1, 1, 'Galletas con chis', 6, 4, 'https://www.pngmart.com/files/16/Chocolate-Cookie-PNG-Transparent-Image.png'),
(57, 2, 1, 'Naranjada', 20, 10, 'https://coca-colafemsa.com/wp-content/uploads/2020/02/1-10.png'),
(58, 2, 1, 'Agua mineral', 16, 8, 'https://img.frubana.com/cmx/products/Ciel_mineralizada_2L-1646264923764.png'),
(59, 1, 1, 'Cacahuate jal.', 14, 7, 'https://deliyum.com/wp-content/uploads/2021/07/cacahuate-japonesenchilado-1.png'),
(60, 2, 1, 'Pepsi', 20, 10, 'https://212global.com/wp-content/uploads/2023/09/62c57dd3fe969b330cfaff7f_thumbnail.png'),
(61, 1, 1, 'Doritos Nacho', 19, 13, 'https://epadelivery.com.mx/images/thumbs/0000060_doritos-nachos-105gr_550.png'),
(62, 4, 1, 'Trident menta', 2, 1, 'https://i.pinimg.com/originals/5e/da/40/5eda40a79eb060d20c49bd6df8c4c0f1.png'),
(63, 4, 2, 'Trident fresa', 2, 1, 'https://d2j6dbq0eux0bg.cloudfront.net/images/36639185/3552828125.png'),
(64, 4, 1, 'Torta ahogada', 38, 17, 'https://tortasahogadaslosprimos.com/wp-content/uploads/2023/01/Torta-Ahogada-V1.png'),
(65, 4, 1, 'Trident uva', 2, 1, 'https://media.cotabest.com.br/media/sku/chiclete-sabor-limonada-e-uva-caixa-21-unidades-trident-cx.png'),
(66, 4, 1, 'Trident Tropical', 2, 1, 'https://www.joysdelights.com.au/cdn/shop/products/trident-tropical_1200x1200.png?v=1668763770'),
(67, 1, 1, 'Doritos 3D', 16, 8, 'https://static.wixstatic.com/media/460de2_86c5f2c192a94d40a09d7f0abe3a13ff~mv2.png/v1/fill/w_262,h_262,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/460de2_86c5f2c192a94d40a09d7f0abe3a13ff~mv2.png'),
(68, 1, 1, 'Doritos Dinamita', 16, 9, 'https://static.wixstatic.com/media/460de2_d50c23265b9c48928fa4dcc5874796a5~mv2.png/v1/fill/w_262,h_262,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/460de2_d50c23265b9c48928fa4dcc5874796a5~mv2.png'),
(69, 1, 1, 'Doritos Flamin ', 16, 9, 'https://detqhtv6m6lzl.cloudfront.net/HCLContenido/producto/FullImage/7501011130272_1.png'),
(70, 1, 1, 'Doritos Diablo', 16, 9, 'https://2amigosdistributions.com/wp-content/uploads/2021/07/sdoritodiablo.jpg'),
(72, 1, 1, 'Ruffles Queso', 17, 9, 'https://revistasociosams.com/wp-content/uploads/2023/09/RUFFLES_QUESO-280G-LLEVA-2.png'),
(73, 1, 1, 'Doritos incognita', 15, 8, 'https://farmaciacalderon.com/cdn/shop/products/7501011123878_300x300.png?v=1605548640'),
(74, 1, 1, 'Emperador de limon', 18, 14, 'https://phorcys-static.ewg.org/kwikee/028/400/344/739.jpg'),
(75, 4, 1, 'Trident  Sandia', 2, 1, 'https://cdn11.bigcommerce.com/s-8vmnhx1n75/products/13469/images/17341/TRIDENT_VALUE_PACK_SAND_12X30.6GR_ST__________________________70598.1616027173.1280.1280.png?c=1'),
(76, 1, 1, 'Cheetos', 14, 6, 'https://d2e63rjlg57kwc.cloudfront.net/products/361755.png'),
(77, 1, 1, 'Mamut', 12, 6, 'https://www.gamesacookies.com/sites/gamesa.com/files/2022-03/mamut-product-big.png'),
(78, 2, 1, 'Bonafont Fresa', 16, 8, 'https://cdn.shopify.com/s/files/1/0566/4391/1854/products/0758104006656_080922_de775fc3-330e-4ae8-ae8f-d3d07b99e222.png?v=1663679630'),
(79, 1, 1, 'Bimbuñuelos', 19, 15, 'https://cdn.shopify.com/s/files/1/0566/4391/1854/products/7503021431042_280921_2d486e29-d56a-49ac-95e1-821b90a04d5a.webp?v=1672966515'),
(80, 1, 1, 'Triki Trakers', 18, 12, 'https://superdulces.com/cdn/shop/products/51febc69c0edd7aafc135a70ac224334_400x.png?v=1656453371'),
(81, 1, 1, 'Chokis ', 18, 12, 'https://www.gamesacookies.com/sites/gamesa.com/files/2021-09/chokis-individual.png'),
(82, 1, 1, 'Oreo', 18, 12, 'https://images.rappi.com.mx/products/842348496777_bnfalptuhcoh_757679941210_xtxxowenyptf_1082356_1.png'),
(83, 2, 1, 'Bonafont piña', 16, 8, 'https://alsuper.online/products/412675_p.png'),
(84, 1, 1, 'Takis Blue Heat', 16, 7, 'https://static.wixstatic.com/media/0bb460_016b501627d749fdb7804640f8c670af~mv2.png/v1/fit/w_500,h_500,q_90/file.png'),
(85, 1, 1, 'Takis Fuego', 16, 8, 'https://www.barcel.com.mx/themes/custom/barceldos/images/files/takis_fuego.png'),
(86, 1, 1, 'Takis Originales', 16, 7, 'https://www.barcel.com.mx/themes/custom/barceldos/images/files/takis_original.png'),
(87, 1, 1, 'Conchas Bimbo', 19, 13, 'https://d5xnv1r45pn40.cloudfront.net/s3fs-public/productos/conchas.png'),
(88, 1, 1, 'Mantecadas Bimbo', 22, 15, 'https://bimbousa.com/sites/default/files/2022-07/MantecadasVainilla_SS_render_web_SFondo_0.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `tip_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id_status`, `tip_status`) VALUES
(1, 'Pendiente'),
(2, 'En proceso'),
(3, 'Terminado'),
(4, 'Pagado'),
(5, 'Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tip_usuarios`
--

CREATE TABLE `tip_usuarios` (
  `Id_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tip_usuarios`
--

INSERT INTO `tip_usuarios` (`Id_rol`) VALUES
('Administrador'),
('Caja'),
('Cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `units`
--

CREATE TABLE `units` (
  `unidad` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `units`
--

INSERT INTO `units` (`unidad`, `description`) VALUES
(1, 'Gramos'),
(2, 'Litros'),
(3, 'Rebanada'),
(4, 'Piezas'),
(5, 'No contable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuario` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ap_paterno` varchar(200) NOT NULL,
  `ap_materno` varchar(200) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Id_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuario`, `name`, `ap_paterno`, `ap_materno`, `telefono`, `email`, `password`, `Id_rol`) VALUES
(1, 'Erick', 'Chavez', 'Ponce', '4495882440', 'erick123@gmail.com', '$2b$12$6Qc8a93tW8Yhg8Jmf.D9PeXMJL.vw.bfP1xsF/IEnaQtQgQ9uLESy', 'Administrador'),
(7, 'Luis', 'Mendez', 'Lopez', '4494679023', 'caja@gmail.com', '$2a$12$FtTuxAilPWRGrENJfGMdkupESTwuwAxRfqCP75BspMqySTIIFiOPy', 'Caja'),
(8, 'Fernando', 'Pedroza', 'Avila', '4494554486', 'cocina@gmail.com', '$2a$12$ErHmtRCVQSbcuA0dGLg5o.KHobAOsB53x2Ryi4ffxZfjPus7wzxjO', 'Cocina');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`tipo_art`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `precio` (`precio`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`folio`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `name` (`name`),
  ADD KEY `precio` (`precio`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `id_status` (`id_status`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `tipo_art` (`tipo_art`),
  ADD KEY `product_ibfk_2` (`unidad`),
  ADD KEY `precio` (`precio`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `tip_usuarios`
--
ALTER TABLE `tip_usuarios`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indices de la tabla `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unidad`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `Id_rol` (`Id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `tipo_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `units`
--
ALTER TABLE `units`
  MODIFY `unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `product` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `pedido` (`folio`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `product` (`id_producto`),
  ADD CONSTRAINT `detalle_ibfk_3` FOREIGN KEY (`name`) REFERENCES `product` (`name`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`tipo_art`) REFERENCES `articulo` (`tipo_art`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`unidad`) REFERENCES `units` (`unidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Id_rol`) REFERENCES `tip_usuarios` (`Id_rol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
