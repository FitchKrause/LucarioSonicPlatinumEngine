/// @description  Custom step script

if (step_script <> noone)
{
    if (script_exists(step_script))
    {
        script_execute(step_script);
    }
}

