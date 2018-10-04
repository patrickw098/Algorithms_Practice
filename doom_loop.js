const findingJob = () => {
    let gotJob = false;
    let applications = 0;
    let salary = 0;

    return doomLoop = (jobApplication) => {
        applications++;
        console.log(gotJob, applications);

        gotJob = jobApplication.hired;

        if ( gotJob ) {
            salary = jobApplication.salary;
            return salary;
        } else if ( !gotJob ) {
            return doomLoop;
        }
    }
}

const student = findingJob();

const jobOne = {
    hired: false,
    salary: 80000
}

const jobTwo = {
    hired: true,
    salary: 100000
}

student(jobOne);
student(jobOne);
student(jobOne);
student(jobTwo);
student(jobOne);
student(jobOne);
student(jobOne);
student(jobOne);