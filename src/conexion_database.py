import pyodbc

class ConexionBD:
    def __init__(self, servidor, base_datos):
        self.servidor = servidor
        self.base_datos = base_datos
        self.conexion = None

    def conectar(self):
        try:
            conexion_str = f'DRIVER={{SQL Server}};SERVER={self.servidor};DATABASE={self.base_datos};Trusted_Connection=yes;'
            self.conexion = pyodbc.connect(conexion_str)
            print("Conexión establecida con la base de datos.")
        except Exception as e:
            print(f"Error al conectar a la base de datos: {str(e)}")

    def desconectar(self):
        try:
            if self.conexion:
                self.conexion.close()
                print("Conexión cerrada.")
        except Exception as e:
            print(f"Error al cerrar la conexión: {str(e)}")
