Feature: Buscar un usuario por ID

  Background:
    * url urlBase
    * def userId = '0uxuPY0cbmQhpEz1'

  @getUsuarioPorId
  Scenario: Obtener un usuario específico por su ID
    Given path 'usuarios', userId
    When method get
    Then status 200
    And match response contains {nome: '#string', email: '#string', administrador: '#string', _id: '#string' }
    * print 'Usuario encontrado:', response
