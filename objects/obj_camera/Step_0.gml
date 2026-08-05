#region PROCURAR ALVO
// Procura um alvo
if (instance_exists(lista_alvos[0 or 1]))
{
    alvo = instance_find(global.batalha[0].obj, 0);
}
else
{
    alvo = noone;
}
#endregion

#region DESTINO
// Atualiza destino
if (alvo != noone)
{
    xTo = alvo.x;
    yTo = alvo.y;
}
else {
	xTo = 20
    yTo = 20
}
#endregion

#region MOV DA CAMERA
// Movimento suave
x += (xTo - x) / 25;
y += (yTo - y) / 25;
#endregion

#region BLOQUEIA SAIDA DA ROOM
// Não deixar sair da room
x = clamp(x, largura * 0.5, room_width - largura * 0.5);
y = clamp(y, altura * 0.5, room_height - altura * 0.5);
#endregion

#region ATUALIZA CAMERA
// Atualiza a câmera
camera_set_view_pos(
    view_camera[0],
    x - largura * 0.5,
    y - altura * 0.5
);
#endregion
