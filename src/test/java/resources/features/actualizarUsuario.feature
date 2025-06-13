Feature: Actualizar un usuario existente

  Background:
    * url urlBase
    * def userId = '0uxuPY0cbmQhpEz1'
    * def datosActualizados =
    """
    {
      "nome": "Pedro Martinez",
      "email": "pedromartinez@gmail.com",
      "password": "pedro123",
      "administrador": "false"
    }
    """

  @putUsuario
  Scenario: Actualizar los datos de un usuario por ID
    Given path 'usuarios', userId
    And request datosActualizados
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'
    * print 'Usuario actualizado:', response
