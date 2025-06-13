Feature: Registrar un nuevo usuario

  Background:
    * url urlBase
    * def nuevoUsuario =
    """
    {
      "nome": "Jorge Muñoz Fernandez",
      "email": "jmunozf@gmail.com",
      "password": "mamita",
      "administrador": "true"
    }
    """

  @postUsuario
  Scenario: Registrar un nuevo usuario exitosamente
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'
    * print 'Usuario registrado con ID:', response._id
