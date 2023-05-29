-- Este trigger actualiza el precio total del pedido cuando insertas más pedidos

DELIMITER // -- En MySqlWorkbench es necesario utilizarlo para que funcionen los triggers, ya que ; puede originar problemas al utilizarse
CREATE TRIGGER actualizar_precio_pedido
AFTER INSERT ON Stock
FOR EACH ROW
BEGIN
    UPDATE Pedidos
    SET PrecioPedido = (SELECT SUM(Productos.PrecioProducto * Stock.Stock)
                        FROM Productos
                        INNER JOIN Stock ON Productos.IDProducto = Stock.IDProducto
                        WHERE Stock.IDPedido = NEW.IDPedido)
    WHERE IDPedido = NEW.IDPedido;
END//
DELIMITER ;

-- Este trigger actualiza el número de pedidos realizados por un cliente cuando se inserta una nueva fila en pedidos

DELIMITER //
CREATE TRIGGER actualizar_numero_pedidos
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Clientes
    SET NumeroDePedidos = NumeroDePedidos + 1
    WHERE IDCliente = (SELECT IDCliente FROM Pedidos WHERE IDPedido = NEW.IDPedido);
END//
DELIMITER ;


-- Este trigger actualiza el SOTCK al insertar una nueva fila en la tabla

DELIMITER //
CREATE TRIGGER actualizar_stock_producto
AFTER INSERT ON Stock
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET Stock = Stock - NEW.Stock
    WHERE IDProducto = NEW.IDProducto;
END//
DELIMITER ;


-- Cuando se elimina una fila de la tabla stock se actualiza el producto correspondiente
DELIMITER //
CREATE TRIGGER actualizar_stock_eliminar
AFTER DELETE ON Stock
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET Stock = Stock + OLD.Stock
    WHERE IDProducto = OLD.IDProducto;
END//
DELIMITER ;




