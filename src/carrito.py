class CarritoCompras:
    def __init__(self, conexion):
        self.productos = []
        self.conexion = conexion

    def agregar_producto(self, producto):
        self.productos.append(producto)
        print("Producto agregado al carrito.")

    def ver_carrito(self):
        print("Productos en el carrito:")
        for producto in self.productos:
            print(producto)

    def comprar(self):
        # Lógica para realizar la compra
        # Puedes implementar aquí la lógica para procesar el pago, registrar la compra, etc.
        print("Compra realizada con éxito.")
        self.productos = []  # Vaciar el carrito después de realizar la compra
