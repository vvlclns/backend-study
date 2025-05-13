CREATE TABLE `students` (
`name` VARCHAR(10) NOT NULL,
`admission_year` YEAR NOT NULL,
`major` INT NOT NULL,
`student_number` INT NOT NULL,
`phone_number` VARCHAR(15) NOT NULL,
`address` VARCHAR(50) NOT NULL,
`total_credits` INT DEFAULT 0 NOT NULL,
`average_grade` FLOAT DEFAULT 0.0 NOT NULL,
`is_enrolled` TINYINT(1) DEFAULT 1 NOT NULL,
PRIMARY KEY (`admission_year`, `major`, `student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;