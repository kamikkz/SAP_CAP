using {capLearning.schema02.types} from './types/schema02-types';

namespace capLearning.schema02;

using {
    cuid,
    managed,
    temporal
} from '@sap/cds/common';

// Entidad Cliente
entity Client : cuid, managed {
    name     : String(100); // Nombre del cliente
    lastName : String(100); // Apellido del cliente
    eMail    : String(150); // Correo electrónico del cliente
    address  : Association to Address; // Relación con una dirección
    phone    : Association to many Phone
                   on phone.client = $self; // Relación con muchos telefonos
}

// Entidad Dirección
entity Address : cuid, managed {
    client  : Association to Client;
    street  : String; // Calle
    town    : String; // Ciudad
    zipCode : String(5); // Código postal
    country : types.country; // País (reuso de tipo definido)
    phone    : Association to many Phone; // Relación con muchos telefonos
}

// Entidad Teléfono
entity Phone : cuid, managed {
    client    : Association to Client;
    number    : String(15); // Número de teléfono
    phoneType : types.phoneType; // Tipo de teléfono (reuso de tipo definido)
    notes     : String; // Notas adicionales
}

// Entidad Proyectos
entity Projects : cuid, managed {
    name    : String(100); // Nombre del proyecto
    members : Composition of many Members
                  on members.project = $self; // Relación con miembros
}

// Entidad Usuarios
entity Users : cuid, managed {
    username : String(50); // Nombre de usuario
    projects : Composition of many Members
                   on projects.user = $self; // Relación con proyectos
}

// Tabla pivot para Proyectos y Usuarios
entity Members : cuid {
    project : Association to Projects; // Asociación a Projects
    user    : Association to Users; // Asociación a Users
}
