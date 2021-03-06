

-- Mostrar la cantidad de productos que fueron vendidos por cada vendedor
select producto.nombre as Producto, vendedor.nombre as Vendedor, count(pedido.cantidad) as TOTAL 
from producto,vendedor,pedido
where producto.id_vendedor=vendedor.id_vendedor 
and pedido.id_pedido=producto.id_producto
group by vendedor.id_vendedor order by TOTAL desc; 

-- Mostrar cuántos vendedores existen en cada categoria  ordenada por el número de vendedores descendentemente 
select vendedor.nombre count(producto.id_producto) as total
from vendedor, producto
where producto.id_vendedor = vendedor.id_vendedor
group by vendedor.id_categoria
order by total desc;

-- Mostrar el nombre de los prodcutos de la categoria Frutas
select producto.nombre from producto, categoria where producto.id_categoria=categoria.id_categoria and categoria.nombre='Frutas';

-- Mostrar el producto que mas veces se ha comprado y cuantas veces
select producto.nombre, count(pedido.id_producto) as total from producto, pedido
where producto.id_producto=pedido.id_producto group by pedido.id_producto order by total desc

-- Mostrar la descipcion y el precio del producto con el precio mas caro y el mas abrato
select articulos.descripcion,articulos.precio from articulos
select producto.descipcion, producto.precio from producto
where producto.precio = (select max(producto.precio) from producto) 
or producto.precio = (select min(producto.precio) from producto);

-- Mostrar el nombre y apellidos de los 10 clientes que más compras han realizado y mostrar tabien el total 
select cliente.nombre, cliente.apellidos, sum(pedido.importe) as total 
from cliente , pedido
where cliente.id_cliente = pedido.id_pedido
group by pedido.id_clientes order by total desc
limit 10;

-- Mostrar telefono de los clientes que compraron en el mes de Abril
select distinct cliente.nombre, cliente.tlfn, pedido.fecha from cliente, pedido where cliente.dni = pedido.dni_cliente
and month(pedido.fecha)=04;

-- Mostrar los distintas categorias que hay en la tienda online
select categoria.nombre from categoria group by categoria.nombre;

-- Mostrar la media de ventas por mes en el primer semestre del año 2020 
select truncate(avg(total),2) as total_ventas, month(fecha)
as mes from pedido
where fecha between '2020-01-01' and '2020-06-30' group by 2 order by 2 asc;

-- Mostrar el nombre y apellidos de los 4 primeros clientes que menos compras han realizado 
-- y tambien el total de dichas compras 
select cliente.nombre, cliente.apellidos, sum(pedido.total) as Total 
from cliente , pedido
where cliente.dni = pedido.dni_cliente
group by pedido.dni_ order by Total asc
limit 4;