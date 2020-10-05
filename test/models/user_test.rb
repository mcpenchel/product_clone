require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Método de classe, a sintaxe é .nome_do_metodo
  # Método de instância, a sintaxe é #nome_do_metodo

  test '#full_name' do
    # pode pegar um objecto da fixture usando
    # var = nome_do_modelo_no_plural(:nome_do_obj_na_fixture)
    user = users(:george)

    # assert_equal valor retornado, obj.metodo
    assert_equal "George Abitbol", user.full_name
  end

  # Outros cenários para testar esse método:
  # ATENÇÃO!!
  # Esses cenários só são relevantes porque NÃO temos
  # validação de presença nesses campos!
  # Se tivéssemos validação de presença nesses campos,
  # nós testaríamos a validação em si, não precisaríamos
  # destes cenários extras.

  # 1) First_name existe, last_name é nil
  # 2) Last_name existe, first_name é nil
  # 3) First_name e last_name são nil
end
