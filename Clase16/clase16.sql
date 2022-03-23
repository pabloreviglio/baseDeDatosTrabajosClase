SET sql_mode = 'ONLY_FULL_GROUP_BY';

SELECT f.FacturaID, f.FechaFactura, c.compania, cl.contacto, cat.categoriaNombre, p.productoNombre, fd.preciounitario, fd.Cantidad FROM facturas f
JOIN correos c ON f.EnvioVia=c.CorreoID
JOIN clientes cl ON cl.ClienteID=f.ClienteID
JOIN facturadetalle fd ON fd.FacturaID = f.FacturaID
JOIN productos p ON fd.ProductoID = p.ProductoID
JOIN categorias cat ON p.CategoriaID = cat.CategoriaID ;

SELECT * FROM categorias c
LEFT JOIN productos p ON c.CategoriaID = p.CategoriaID;

SELECT * FROM clientes c
LEFT JOIN facturas f ON c.ClienteID = f.ClienteID
WHERE FacturaID IS NULL;

SELECT p.productonombre, c.categorianombre, prov.compania FROM productos p 
LEFT JOIN proveedores prov	ON p.ProveedorID= prov.ProveedorID
JOIN categorias c ON c.CategoriaID = p.CategoriaID;

SELECT c.CategoriaNombre, c.CategoriaID, AVG(PrecioUnitario) FROM categorias c
JOIN productos p ON p.CategoriaID = c.CategoriaID
GROUP BY c.CategoriaID;

SELECT c.contacto, MAX(f.FechaFactura) FROM clientes c
LEFT JOIN facturas f ON f.ClienteID = c.ClienteID
GROUP BY c.Contacto;

SELECT c.compania, COUNT(f.FacturaID) FROM facturas f
RIGHT JOIN correos c ON f.EnvioVia = c.CorreoID
GROUP BY c.Compania;



