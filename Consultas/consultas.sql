

cliente (
dni 
nombre 
apellidos 
direccion 
email 
tlfn
)

create table vendedor (
id_vendedor 
nombre 
direccion 


create table categoria (
id_categoria
nombre 
descripcion 
)

create table producto (
id_producto 
nombre 
descripcion 
precio
stock 
id_vendedor 
id_categoria
constraint producto_FK foreign key (id_vendedor) references vendedor(id_vendedor),
constraint producto_FK2 foreign key (id_categoria) references categoria(id_categoria)
)

create table pedido (
id_pedido 
nombre 
fecha 
total 
cantidad 
dni_cliente 
id_producto 
constraint pedido_FK foreign key (dni_cliente) references cliente(dni),
constraint pedido_FK2 foreign key (id_producto) references producto(id_producto)
)

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