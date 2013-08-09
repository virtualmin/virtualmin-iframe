# Skeleton file

BEGIN { push(@INC, ".."); };
eval "use WebminCore;";
&init_config();

1;

