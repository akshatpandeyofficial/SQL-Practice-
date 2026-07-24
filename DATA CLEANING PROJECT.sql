select * from layoffs;

create table layoff_staging like layoffs;
select * from layoff_staging;

insert layoff_staging
select * from layoffs;

select * from layoff_staging;


with CTE_Clean as (
select*,
row_number () over (PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country , funds_raised_millions ) as row_num
from layoff_staging
)
select* from CTE_Clean where row_num >1;  

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoff_staging2;

insert into layoff_staging2
select*,
row_number () over (PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country , funds_raised_millions ) as row_num
from layoff_staging;

select * from layoff_staging2; 

select * from layoff_staging2 where row_num >1;
delete  from layoff_staging2 where row_num>1;


-- Standardizing data


select* from layoff_staging2;



-- Trimming Spaces from company Column
select trim(company)
from layoff_staging2;

update layoff_staging2 
set company = trim(company);

-- cleaning redundant data from industry 
select DISTINCT industry from layoff_staging2;
select * from layoff_staging2
where industry LIKE 'crypto%';

update layoff_staging2
set industry = 'Crypto'
where industry LIKE 'Crypto%';



select distinct Country from layoff_staging2
order by 1;


select distinct country , trim(trailing '.' from country);

update layoff_staging2
set country = trim(trailing  '.' from country)
where country  like 'United States%'; 
