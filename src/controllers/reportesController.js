function venta_dia(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query("SELECT b.fecha, SUM(a.cantidad * c.precio) AS total FROM detalle a JOIN pedido b ON a.folio = b.folio JOIN product c ON c.id_producto = a.id_producto WHERE b.fecha = date(?) and b.id_status=5 GROUP BY b.fecha;", [data.fecha], (err, rep_dia) => {
            if (rep_dia.length > 0) {
                reporte_dia = [{
                    fecha:data.fecha,
                    total:rep_dia[0].total
                }];
                res.render("pages/reportes/c-rep-venta", {reporte_dia});

            } else {
                res.render("pages/reportes/c-rep-venta", { errd: "No existen datos respecto a esos días" });
            }
        })
    })
}

function venta_periodo(req,res){
    const data = req.body;

    req.getConnection((err, conn)=>{
        conn.query("SELECT DATE_FORMAT(a.fecha, '%d-%m-%Y') AS fecha ,SUM(b.cantidad*b.precio) AS total FROM pedido a, detalle b WHERE b.folio=a.folio and a.fecha>=date(?) AND a.fecha<=date(?) AND a.id_status=5 GROUP BY fecha",[data.fecha_i,data.fecha_f],(err,rep_periodo)=>{
            if(rep_periodo.length>0){
                //console.log(rep_periodo);
                res.render("pages/reportes/c-rep-venta",{rep_periodo});
            } else {
                res.render("pages/reportes/c-rep-venta",{errp: "No existen datos respecto a esos días"});
            }
        })
    })
}

function trabajador_dia(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query("SELECT DATE_FORMAT(a.fecha, '%d-%m-%Y') AS fecha, a.folio, a.correo_clie,b.name,b.ap_paterno FROM pedido a, users b WHERE a.id_status=5 AND a.fecha=date(?) AND b.email=a.corre_emp GROUP BY fecha", [data.fecha], (err, reporte_dia) => {
            if (err) throw err;
            if (reporte_dia.length > 0) {
                //console.log(reporte_dia);
                res.render("pages/reportes/c-rep-trabajador", { reporte_dia });
            } else {
                res.render("pages/reportes/c-rep-trabajador", { errd: "No existen datos respecto a esos días" });

            }
        })
    })
}

function trabajador_periodo(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query("SELECT DATE_FORMAT(a.fecha, '%d-%m-%Y') AS fecha, a.folio, a.correo_clie,b.name,b.ap_paterno FROM pedido a, users b WHERE a.id_status=5 AND a.fecha>=date(?) AND a.fecha<=date(?) AND b.email=a.corre_emp GROUP BY a.fecha ORDER BY a.fecha;", [data.fecha_i, data.fecha_f], (err, reporte_periodo) => {
            if (err) throw err;
            if (reporte_periodo.length > 0) {
                //console.log(reporte_periodo);
                res.render("pages/reportes/c-rep-trabajador", { reporte_periodo });
            } else {
                res.render("pages/reportes/c-rep-trabajador", { errp: "No existen datos respecto a esos días" });

            }
        })
    })
}

function producto_dia(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query("SELECT c.name, SUM(b.cantidad) AS cantidad_total, SUM(c.costo*b.cantidad) AS costo_total, SUM(b.cantidad*c.precio) AS subtotal FROM product c JOIN detalle b ON c.id_producto = b.id_producto JOIN pedido a ON b.folio = a.folio WHERE a.id_status=5 and a.folio=b.folio and a.fecha=date(?) GROUP BY c.name ORDER BY SUM(b.cantidad*c.precio) DESC;", [data.fecha], (err, reporte_dia) => {
            if (err) throw err;
            if (reporte_dia.length > 0) {
                res.render("pages/reportes/c-rep-producto", { reporte_dia });
            } else {
                res.render("pages/reportes/c-rep-producto", { errd: "No existen datos respecto a esos días" });
            }
        })
    })
}

function producto_periodo(req, res) {
    const data = req.body;
    req.getConnection((err, conn) => {
        conn.query("SELECT a.fecha, c.id_producto, c.name, SUM(b.cantidad) AS cantidad_total, SUM(c.costo*b.cantidad) AS costo_total,SUM(b.cantidad*c.precio) AS subtotal FROM product c JOIN detalle b ON c.id_producto = b.id_producto JOIN pedido a ON b.folio = a.folio WHERE a.folio=b.folio and a.fecha>=date(?) AND a.fecha<=date(?) and a.id_status=5 GROUP BY a.fecha, c.name ORDER BY SUM(b.cantidad*c.precio) DESC;", [data.fecha_i, data.fecha_f], (err, reporte_periodo) => {
            if (err) throw err;
            if (reporte_periodo.length > 0) {
                //console.log(reporte_periodo);
                res.render("pages/reportes/c-rep-producto", { reporte_periodo });
            } else {
                res.render("pages/reportes/c-rep-producto", { errp: "No existen datos respecto a esos días" });

            }
        })
    })
}

function detalle_dia(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query("SELECT DATE_FORMAT(b.fecha, '%d-%m-%Y') AS fecha, b.folio, b.correo_clie, a.name FROM detalle a JOIN pedido b ON a.folio = b.folio JOIN product c ON c.id_producto = a.id_producto WHERE b.fecha=date(?) AND b.id_status=5 GROUP BY a.folio, a.name;", [data.fecha], (err, reporte_dia) => {
            if (err) throw err;
            if (reporte_dia.length > 0) {
                //console.log(reporte_periodo);
                res.render("pages/reportes/c-rep-detalle", { reporte_dia });
            } else {
                res.render("pages/reportes/c-rep-detalle", { errd: "No existen datos respecto a esos días" });

            }
        })
    })
}

function detalle_periodo(req, res) {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query("SELECT DATE_FORMAT(b.fecha, '%d-%m-%Y') AS fecha, b.folio, b.correo_clie, a.name FROM detalle a JOIN pedido b ON a.folio = b.folio JOIN product c ON c.id_producto = a.id_producto WHERE b.fecha>=date(?) AND b.fecha<=date(?) AND b.id_status=5 GROUP BY a.folio, a.name;", [data.fecha_i, data.fecha_f], (err, reporte_periodo) => {
            if (err) throw err;
            if (reporte_periodo.length > 0) {
                //console.log(reporte_periodo);
                res.render("pages/reportes/c-rep-detalle", { reporte_periodo });
            } else {
                res.render("pages/reportes/c-rep-detalle", { errp: "No existen datos respecto a esos días" });

            }
        })
    })
}

function createreporteventa(req, res) {
    res.render('pages/reportes/c-rep-venta');
}



function createreportedetalle(req, res) {
    res.render('pages/reportes/c-rep-detalle');
}


function createreportetrabajador(req, res) {
    res.render('pages/reportes/c-rep-trabajador');
}

function createreporteproducto(req, res) {
    res.render('pages/reportes/c-rep-producto');
}


module.exports = {
    venta_dia,
    venta_periodo,
    trabajador_dia,
    trabajador_periodo,
    producto_dia,
    producto_periodo,
    detalle_dia,
    detalle_periodo,
    createreporteventa,
    createreportedetalle,
    createreportetrabajador,
    createreporteproducto,
}