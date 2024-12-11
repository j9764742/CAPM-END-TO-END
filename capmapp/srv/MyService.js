module.exports = (srv) => {
    srv.on('pokymon', req => {
        return `Hello ${req.data.name}`
    });
}