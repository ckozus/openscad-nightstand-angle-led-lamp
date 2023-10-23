// medidas referencia

// Ancho madera lateral 19mm
lateral_width = 19;
// Ancho madera trasera 20mm
back_width = 20;
// Profundidad protuberancia 24mm (max)
height = 23;

// Cobertura para caida exterior e interior
cover_depth = 3;

// Largo brazos deseado
arm_length = 200;

// tamaño alerón para tapar leds
flap_depth = 15;

difference() {
    // L formada por los dos brazos (para insertar en el mueble y el flap donde se insertará la tira de leds)
    union() {
        // Brazo lateral + flap lateral
        cube([arm_length, lateral_width + (cover_depth * 2) + flap_depth, height + cover_depth]);
        // Brazo trasero + flap trasero
        cube([back_width + (cover_depth * 2) + flap_depth, arm_length, height + cover_depth]);
    }
    // Interior brazo lateral
    translate([cover_depth, cover_depth, -1]) cube([arm_length + 1, lateral_width, height + 1]);
    // Interior brazo trasero
    translate([cover_depth, cover_depth, -1]) cube([back_width, arm_length, height + 1]);
    // Interior flap lateral
    // Aquí la gran duda es si la led strip cabe en la altura deseada (dada la altura de la mesa). Debería haber una altura mínima dada por el ancho de la tira de leds.
    translate([back_width + (cover_depth * 2), lateral_width + (cover_depth * 2), cover_depth]) cube([arm_length, flap_depth + 0.1, height - cover_depth]);
    translate([back_width + (cover_depth * 2), lateral_width + (cover_depth * 2), cover_depth]) cube([flap_depth + 0.1, arm_length, height - cover_depth]);
    
}