-- 앨범정보 추출(아이템이 가지고있는 장르포함)
select
a.title,a.reg_date,
group_concat(a.categorynm) categorynm
from
(
select
	a.title -- 앨범제목
	,a.reg_date -- 출시년도
	,(
		select
			value
		from
			comcode
		where parentscd = '002' 
			and code = b.categoryid
	) categorynm
from
	album a join item b
		on a.id = b.albumid
) a
;
-- 공통코드 조회 function을 사용
select
a.title,a.reg_date,
group_concat(a.categorynm) categorynm
from
(
select
	a.title -- 앨범제목
	,a.reg_date -- 출시년도
	, fnGetCommonCode('002',null,b.categoryid) categorynm
from
	album a join item b
		on a.id = b.albumid
) a
;
-- 앨번에 속한 노래
select
b.*
from
album a join item b
		on a.id = b.albumid
        ;

-- 공통코드가 있는 데이터 조회
select
	a.title -- 앨범제목
	,a.reg_date -- 출시년도
	,fnGetCommonCode('002',null,'001')
from
	album a join item b
		on a.id = b.albumid
        ;


-- 공통코드 조회
select
code,
value
from
comcode
where
parentscd = '002'
and groupcd = 'etc'
and code = '001';

show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1;
commit;