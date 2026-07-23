select * from layoffs_dataset;


create table layoff
like layoffs_dataset;

insert layoff
select * from layoffs_dataset;

select * from layoff;

-- Data Cleaning 

-- 1. Identifiying Duplicates
 select *,
 row_number() over( 
 PARTITION BY company, location,industry, total_laid_off, percentage_laid_off,`date`, stage , country, funds_raised_millions)
 from layoff;
 
 
with  duplicate_cte as (
select *,
 row_number() over( 
 PARTITION BY company, location,industry, total_laid_off, percentage_laid_off,`date`, stage , country, funds_raised_millions) as ROW_NUM
 from layoff
)
select * from duplicate_cte
where row_num >2 ;

CREATE TABLE `layoff2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `Row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from  layoff2;

insert into layoff2
select *,
 row_number() over( 
 PARTITION BY company, location,industry, total_laid_off, percentage_laid_off,`date`, stage , country, funds_raised_millions) as ROW_NUM
 from layoff;

select * 
from layoff2
where ROW_NUM > 1;

delete 
from layoff2
where ROW_NUM > 1 ;



