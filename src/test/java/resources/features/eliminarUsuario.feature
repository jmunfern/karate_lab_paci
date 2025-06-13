Feature: Eliminar un usuario existente

  Background:
    * url urlBase
    * def userId = "3iXQ2eQGtAiiXe4B"

  @deleteUsuario
  Scenario: Eliminar un usuario por ID
    Given path 'usuarios', userId
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'
    * print 'Usuario eliminado:', response
