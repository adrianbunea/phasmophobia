describe('Homepage', () => {
    beforeEach(() => {
        cy.visit('localhost:1234')
    })

    it('displays \'Hello, world!\'', () => {
        cy.contains('Hello, world!')
    })
})
