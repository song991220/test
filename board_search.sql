-- 곡 : 노래 / 가수
-- 아디스트 : 가수
-- 앨범 : 앨범명 / 가수

select
	*
from
	(
	select
		a.title albumtitle,
		a.singersong,
		b.title songtitle
	from
		album a left join item b on a.id = b.albumid
	) T
where
	T.albumtitle like '%크%' 
		or T.singersong like '%크%' 
        or T.songtitle like '%크%'
;


;