from conexion_database import ConexionBD
from carrito import CarritoCompras

class Cliente:
    def __init__(self, nombre, apellido, email, telefono):
        self.nombre = nombre
        self.apellido = apellido
        self.email = email
        self.telefono = telefono

    def __str__(self):
        return f'{self.nombre} {self.apellido} - {self.email}'

class Producto:
    def __init__(self, nombre, categoria, precio, descripcion, calorias):
        self.nombre = nombre
        self.categoria = categoria
        self.precio = precio
        self.descripcion = descripcion
        self.calorias = calorias

    def __str__(self):
        return f'{self.nombre} - {self.categoria} - ${self.precio}'

def mostrar_menu():
    print("\n¡Bienvenido al carrito de compras de Fullsport!")
    print("Por favor, elija una opción:")
    print("1. Buscar un producto")
    print("2. Agregar un producto al carrito")
    print("3. Comprar")
    print("4. Ver el carrito")
    print("5. Salir")

def ejecutar_carrito_compras():
    conexion = ConexionBD(servidor=r'MELISSA-LAPTOP\SQLEXPRESS01', base_datos='dbFullsport_ok')
    carrito = CarritoCompras(conexion)

    opcion = 0
    while opcion != 5:
        mostrar_menu()
        try:
            opcion = int(input("Ingrese el número de la opción que desea: "))
            if opcion == 1:
                buscar_producto(conexion)
            elif opcion == 2:
                agregar_producto_al_carrito(conexion, carrito)
            elif opcion == 3:
                realizar_compra(conexion, carrito)
            elif opcion == 4:
                carrito.ver_carrito()
            elif opcion == 5:
                print("Gracias por usar el carrito de compras de Fullsport. ¡Hasta luego!")
            else:
                print("Opción no válida. Por favor, ingrese un número válido.")
        except ValueError:
            print("Error: ingrese un número válido.")

def buscar_producto(conexion):
    try:
        nombre_producto = input("Ingrese el nombre del producto que desea buscar: ")
        # Realizar la consulta a la base de datos para buscar el producto por nombre
        conexion.conectar()
        cursor = conexion.conexion.cursor()
        cursor.execute("SELECT * FROM Producto WHERE nombre_producto = ?", nombre_producto)
        producto = cursor.fetchone()
        if producto:
            print("Producto encontrado:")
            print(f"Nombre: {producto[1]}")
            print(f"Categoría: {producto[2]}")
            print(f"Precio: ${producto[3]}")
            print(f"Descripción: {producto[4]}")
            print(f"Calorías: {producto[5]}")
        else:
            print("Producto no encontrado.")
        conexion.desconectar()
    except Exception as e:
        print("Error al buscar el producto:", e)

def agregar_producto_al_carrito(conexion, carrito):
    try:
        nombre_producto = input("Ingrese el nombre del producto que desea agregar al carrito: ")
        conexion.conectar()  # Conectar a la base de datos
        # Lógica para buscar el producto en la base de datos
        producto_encontrado = buscar_producto(nombre_producto, conexion)
        if producto_encontrado:
            print("Producto encontrado:")
            print(producto_encontrado)
            carrito.agregar_producto(producto_encontrado)
        else:
            print("Producto no encontrado.")
        # No desconectar aquí para mantener la conexión abierta
    except Exception as e:
        print("Error al agregar el producto al carrito:", e)

def realizar_compra(conexion, carrito):
    try:
        conexion.conectar()  # Conectar a la base de datos
        carrito.comprar()  # Realizar la compra
        conexion.desconectar()  # Desconectar de la base de datos
    except Exception as e:
        print("Error al realizar la compra:", e)

if __name__ == "__main__":
    ejecutar_carrito_compras()
