namespace capLearning.schema01;

using {cuid} from '@sap/cds/common';


entity Clientes : cuid {
    Nombre            : String(100); // Nombre del cliente
    Apellido          : String(100); // Apellido del cliente
    CorreoElectronico : String(150); // Correo electrónico del cliente
    Telefono          : String(15); // Teléfono del cliente
    Direccion         : String(255); // Dirección del cliente
    Ciudad            : String(100); // Ciudad
    Pais              : String(100); // País
    FechaRegistro     : Date; // Fecha de registro del cliente
    Estado            : String(20); // Estado del cliente (e.g., Activo, Inactivo)
}
