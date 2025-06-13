Feature: Obtener lista de todos los usuarios

  Background:
    * url urlBase

  @getUsuarios
  Scenario: Validar la obtención de todos los usuarios
    Given path 'usuarios'
    When method get
    Then status 200

    # Validar que la respuesta tenga la cantidad y una lista de usuarios
    And match response contains { quantidade: '#number', usuarios: '#[]' }

    # Validar que cada usuario tenga los campos esperados con tipos correctos
    * def usuarios = response.usuarios
    * match each usuarios contains {nome: '#string', email: '#string', administrador: '#string', _id: '#string'}
    # Imprimir la cantidad de usuarios
    * print 'Cantidad de usuarios:', response.quantidade
