const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

async function findJsFiles(directory) {
    try {
        const files = await readdir(directory);

        for (const file of files) {
            const fullPath = path.join(directory, file);
            const fileStat = await stat(fullPath);

            if (fileStat.isDirectory()) {
                await findJsFiles(fullPath); // Recursively search in subdirectory
            }
            else {
                const extension = path.extname(fullPath);
                if (extension === '.js') {
                    console.log(fullPath);
                }
            }
        }
    }
    catch (err) {
        console.error(err);
    }
}

findJsFiles('test');