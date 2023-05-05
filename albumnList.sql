-- albumn

select
*
from
album a left join item b on a.id = b.albumid
;
