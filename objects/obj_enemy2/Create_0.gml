sprite_index = spr_cavaleiro
image_blend = make_colour_rgb(255, 0, 0)

vel = 1
vspeed = vel;

#region METODOS TESTE


bati_parede = function()
{
    parede = place_meeting(x, y, obj_colisor)
}

movimenta = function()
{
    
    
    if parede
    {
        if vspeed == 1
        {
            vspeed = -1
        }
        else if vspeed == -1 {
            vspeed = 1
        }
    }
}


#endregion