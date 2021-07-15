/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function myFunctions() {
//                                            alert("I am an alert box!");
//                                           e.preventDefault();
                                            alert(document.getElementById("merit").value);
                                            const text = document.querySelector('#merit').value;
                                            const newLi = document.createElement('#icNum');
                                            const newEl = document.createElement('td');
//                                            const newLi = document.createElement('tr');
                                            const newSajak = document.createTextNode(text);
                                            newEl.className = "table table-bordered";
                                            newEl.appendChild(newSajak);

                                            const ul = document.querySelector('#dataMeritTable');
                                            ul.appendChild(newEl);
                                        }

                                        addForm.addEventListener("submit", function (e) {
                                            alert('hello');
                                        })

                                        var i = 0;
                                        

                                        addForm.addEventListener('submit', function (e) {
                                            alert(document.getElementById("merit").value);


                                            i = i + 1;

                                            const stuName = document.querySelector('#name').value;
                                            const stuPos = document.querySelector('#role').value;
                                            const stuMatric = document.querySelector('#matricNum').value;
                                            const stuIC = document.querySelector('#icNum').value;
                                            const stuMerit = document.querySelector('#merit').value;

                                            const newLine = document.createElement('tr');

                                            const newCol1 = document.createElement('td');
                                            const newCol2 = document.createElement('td');
                                            const newCol3 = document.createElement('td');
                                            const newCol4 = document.createElement('td');
                                            const newCol5 = document.createElement('td');
                                            const newCol6 = document.createElement('td');
                                            const newXButton = document.createElement('button');

                                            var newStuName = document.createTextNode(stuName);
                                            const newStuPos = document.createTextNode(stuPos);
                                            const newStuMatric = document.createTextNode(stuMatric);
                                            const newStuIC = document.createTextNode(stuIC);
                                            const newStuMerit = document.createTextNode(stuMerit);

                                            
                                            newCol1.appendChild(newStuName);
                                            newCol1.classList = 'class="name' + i + '"';
//                                            newCol1.nameName ="name";
                                            newCol2.appendChild(newStuPos);
                                            newCol2.classList = 'class="role' + i + '"';
//                                            newCol2.nameName ="newStuPos";
//                                            newCol2.valueName ="<?= $newStuPos ?>";
                                            newCol3.appendChild(newStuMatric);
                                            newCol3.classList = 'class="matricNum' + i + '"';
                                            newCol4.appendChild(newStuIC);
                                            newCol4.classList = 'class="icNum' + i + '"';
                                            newCol5.appendChild(newStuMerit);
                                            newCol5.classList = 'class="merit' + i + '"';
                                            newXButton.appendChild(document.createTextNode('Delete'));
                                            newXButton.classList = "btn btn-danger btn-block";
                                            newCol6.appendChild(newXButton);
                                            newXButton.addEventListener('click', function (e) {
                                                console.log(stuName);
                                                alert(stuName + ' will be deleted from the list');
                                                $(e).parents("tr").remove();
//                                                newXButton.parentElement.style.display = 'none';
//                                                newCol1.style.display = 'none';
//                                                newCol2.style.display = 'none';
//                                                newCol3.style.display = 'none';
//                                                newCol4.style.display = 'none';
//                                                newCol5.style.display = 'none';
                                            });

                                            const tr = document.querySelector('#dataMeritTable');
                                            tr.appendChild(newLine);
                                            tr.appendChild(newCol1);
                                            tr.appendChild(newCol2);
                                            tr.appendChild(newCol3);
                                            tr.appendChild(newCol4);
                                            tr.appendChild(newCol5);
                                            tr.appendChild(newCol6);


                                            const delPuisi = document.querySelectorAll('tr');
                                            console.log(delPuisi.length - 1);

                                            document.querySelector('#bilangan').innerHTML = i;
//                                            
////            event.preventDefault();
//                          

                                            var formData = $(this).serialize();
                                            console.log(formData);




                                             
                                        })
                                        
                                            
                                        
                                            $("#test").click(function (event) {
//        event.preventDefault();

        //use this technique for ajax data if not using RESTFul
        //NOTE: this will capture the name attribute (not id) in our form
//        formData = 'name=AMIRUL';
//        var formData = $(this).serialize();
//        console.log(formData);
        
//        var lastRowId = $('#dataMeritTable tr:last').attr("name"); /* finds id of the last row inside table */
        const delPuisi = document.querySelectorAll('tr');
        alert(delPuisi.length - 1);

//        $.ajax({
//            type: "POST",
//            url: "http://localhost/College-Merit-Management-System-cmms/College-Merit-Management-System-cmms/CMM_System/myapi/user",
//            data: formData,
//            dataType: "json",
//
//            success: function (data, status, xhr) {
//                if (data.rowcount > 0) {
//                    alert("ok, successfully add data");
//                } else {
//                    alert("fail to insert, " + data.errormessage);
//                }
//            },
//
//            error: function (xhr, resp, text) {
//                alert("error " + xhr + ", " + resp + ", " + text);
//            },
//        });
    });
    
    

                                        $("#addForm").submit(function (e) {
                                            e.preventDefault();
                                        });
