tela_y = room_height + 200
tela_x = room_width - 430

quadro_escolhas = function()
{
  draw_rectangle(tela_x, tela_y , 1200, tela_y + 151, true) 
  draw_text(400, 300, "APERTA B PARA TIRAR A VIDA DOS PERSONAGENS ALIADO\nDEPOIS QUE TIRA BASTANTE VIDA, APERTA ESPAÇO PARA USAR HABILIDADE DA SANTA\n SÓ UM TESTE PARA VER SE FUNCIONA")
  draw_text(200, 100, "A santa cura 9% do dano de ataque basico dela\n A tecla X aumenta o ataque basico dela em 5 eu acho\ntente usar para ver a cura aumentar ")  
}


