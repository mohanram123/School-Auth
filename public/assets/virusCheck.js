const { promises } = require('fs');
const nvt          = require('node-virustotal');
const { resolve } = require('path');
const defaultTimedInstance = nvt.makeAPI();
var sha256File = require('sha256-file');
const {readFile} = require("fs");
    fs         =require('fs');
var fileId;

function file_Id(filePath){
    return sha256File(filePath); 
}

async function fnc1(fileName){
  return new Promise(
      function(resolve,reject){
        const aMaliciousFile = require('fs').readFileSync(fileName);
    const theSameObject =defaultTimedInstance.uploadFile(aMaliciousFile, fileName, 'application/x-msdownload', function(err, res){
    if (err) {
        console.log('Well, crap.');
        console.log(err);
        reject(err);
    }
    resolve(res);
    }
  );
});
}

async function fnc2(fileId){
    return new Promise(
        function(resolve,reject){
            check=1;
            const theSameObject2 =defaultTimedInstance.fileLookup(fileId, function(err, res){
                if (err) {
                console.log('Well, crap.');
                console.log(err);
                reject(err);
                }
                
                res_attr=JSON.parse(res)['data']['attributes'];
                last_analysis_stats=res_attr['last_analysis_stats'];
                magic=res_attr['magic'];
                total_votes=res_attr['total_votes'];
                if(last_analysis_stats){
                    if(last_analysis_stats['harmless']==0 & last_analysis_stats['malicious']==0 & last_analysis_stats['suspicious']==0){
                        console.log('Nothing!');
                        check=1;
                    }
                    else if(last_analysis_stats['malicious']>last_analysis_stats['harmless'] | last_analysis_stats['suspicious']>last_analysis_stats['harmless'] | total_votes['malicious']>total_votes['harmless']){
                        console.log('Serious!');
                        console.log(magic);
                        console.log(total_votes);
                        check=0;
                    }
                }
                resolve([res_attr,last_analysis_stats,magic,total_votes,check]);
            });
  });
  }
async function test(filePath){
    return new Promise(
        function(resolve,reject){
            fileContent=readFile(filePath,async function(err,data){
            fs.unlinkSync(filePath);
            resolve(data);  
            });
        }
    );  
}
module.exports={
    first:fnc1,
    second:fnc2,
    third:file_Id,
    test:test
}