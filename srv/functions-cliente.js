const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
  const { Cliente } = this.entities;

  // Crear un cliente
  this.on('CREATE', 'Clientes', async (req) => {
    req.data.ID = cds.utils.uuid(); // Generar un UUID automáticamente
    return cds.tx(req).run(INSERT.into(Cliente).entries(req.data));
  });

  // Leer clientes
  this.on('READ', 'Clientes', async (req) => {
    return cds.tx(req).run(SELECT.from(Cliente));
  });

  // Actualizar cliente
  this.on('UPDATE', 'Clientes', async (req) => {
    const { ID } = req.params[0];
    return cds.tx(req).run(UPDATE(Cliente).set(req.data).where({ ID }));
  });

  // Eliminar cliente
  this.on('DELETE', 'Clientes', async (req) => {
    const { ID } = req.params[0];
    return cds.tx(req).run(DELETE.from(Cliente).where({ ID }));
  });
});
