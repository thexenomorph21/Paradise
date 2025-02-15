/obj/machinery/atmospherics/pipe/simple/hidden
	icon_state = "intact"
	level = 1
	alpha = 128		//set for the benefit of mapping - this is reset to opaque when the pipe is spawned in game

/obj/machinery/atmospherics/pipe/simple/hidden/scrubbers
	name = "Scrubbers pipe"
	desc = "A one meter section of scrubbers pipe"
	icon_state = "intact-scrubbers"
	connect_types = list(CONNECT_TYPE_SCRUBBER)
	layer = 2.38
	icon_connect_type = "-scrubbers"
	color = PIPE_COLOR_RED

/obj/machinery/atmospherics/pipe/simple/hidden/scrubbers/examine(mob/user)
	. = ..()
	. += "<span class='notice'>This is a special 'scrubber' pipe, which does not connect to 'normal' pipes. If you want to connect it, use \
			a Universal Adapter pipe.</span>"

/obj/machinery/atmospherics/pipe/simple/hidden/supply
	name = "Air supply pipe"
	desc = "A one meter section of supply pipe"
	icon_state = "intact-supply"
	connect_types = list(CONNECT_TYPE_SUPPLY)
	layer = 2.39
	icon_connect_type = "-supply"
	color = PIPE_COLOR_BLUE

/obj/machinery/atmospherics/pipe/simple/hidden/supply/examine(mob/user)
	. = ..()
	. += "<span class='notice'>This is a special 'supply' pipe, which does not connect to 'normal' pipes. If you want to connect it, use \
			a Universal Adapter pipe.</span>"

/obj/machinery/atmospherics/pipe/simple/hidden/universal
	name="Universal pipe adapter"
	desc = "An adapter for regular, supply and scrubbers pipes"
	connect_types = list(CONNECT_TYPE_NORMAL, CONNECT_TYPE_SUPPLY, CONNECT_TYPE_SCRUBBER)
	icon_state = "map_universal"

/obj/machinery/atmospherics/pipe/simple/hidden/universal/examine(mob/user)
	. = ..()
	. += "<span class='notice'>This allows you to connect 'normal' pipes, red 'scrubber' pipes, and blue 'supply' pipes.</span>"

/obj/machinery/atmospherics/pipe/simple/hidden/universal/update_overlays()
	. = list()
	alpha = 255
	. += SSair.icon_manager.get_atmos_icon("pipe", color = pipe_color, state = "universal")
	update_underlays()

/obj/machinery/atmospherics/pipe/simple/hidden/universal/update_underlays()
	underlays.Cut()

	if(node1)
		universal_underlays(node1)
		if(node2)
			universal_underlays(node2)
		else
			var/node2_dir = turn(get_dir(src,node1),-180)
			universal_underlays(direction = node2_dir)
	else if(node2)
		universal_underlays(node2)
		var/node1_dir = turn(get_dir(src,node2),-180)
		universal_underlays(direction = node1_dir)
	else
		universal_underlays(direction = dir)
		universal_underlays(direction = turn(dir, -180))

/obj/machinery/atmospherics/pipe/simple/hidden/yellow
	color = PIPE_COLOR_YELLOW

/obj/machinery/atmospherics/pipe/simple/hidden/cyan
	color = PIPE_COLOR_CYAN

/obj/machinery/atmospherics/pipe/simple/hidden/green
	color = PIPE_COLOR_GREEN

/obj/machinery/atmospherics/pipe/simple/hidden/purple
	color = PIPE_COLOR_PURPLE

/obj/machinery/atmospherics/pipe/simple/hidden/red
	color = PIPE_COLOR_RED

/obj/machinery/atmospherics/pipe/simple/hidden/blue
	color = PIPE_COLOR_BLUE
