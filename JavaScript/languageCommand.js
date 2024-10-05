//HTML이 완전히 로드된 후에 실행되는 이벤트 리스너 추가
document.addEventListener("DOMContentLoaded", function(){

    // 각 메인 페이지와 그에 속한 하위 요소들의 ID를 객체로 저장
    const languageElements = {
        HTML_main:[],
        CSS_main:["CSS_boxModel_background", "CSS_layout_grid_flax", "CSS_textStyling", "CSS_transition_animation", "CSS_media_table", "CSS_overflow_scroll", "CSS_transform_addProperties", "CSS_cursor_pointer"],
        JS_main:["JS_arithmeticList", "JS_inOutput", "JS_Implicit_DateObject", "JS_Implicit_MathObject"],
        Java_main:["Java_typeList", "Java_systemInOut", "Java_arithmeticList"],
        MySQL_main:[],
        Oracle_main:[],
        JSP_main:[],
        Spring_main:[],
        python_main:[]
    };
    
    //main태그를 선택
    const main = document.querySelector("main");

    //ID에 해당하는 HTML파일을 불러와 main에 삽입하는 함수
    function loadContent(ContentsId) {
        //fetch : 파일을 비동기적으로 가져옴
        fetch(`/languageContents/${ContentsId}.html`)
            //응답을 텍스트로 변환
            .then(function(response){
                return response.text();
            })
            //변환된 텍스트를 main안에 삽입
            .then(function(data){
                main.innerHTML = `<section class="${ContentsId}">${data}</section>`;
            })
            //에러 발생시 콘솔에 출력하고 에러 메세지를 표시
            .catch(function(error){
                console.error(`Failed to load content for ${ContentsId}:`, error);
                main.innerHTML = `<section class="${ContentsId}">콘텐츠를 불러오는데 실패했습니다.</section>`;
            });
    }

    //현재 main의 id가 languageElements 객체의 키로 존재하면 해당 내용을 로드하고 이벤트 리스너 추가
    if(languageElements[main.id]){
        //메인 페이지 콘텐츠 로드
        loadContent(main.id);
    
        //해당 메인 페이지의 하위 요소들에 대해 클릭 이벤트 리스너 추가
        languageElements[main.id].forEach(id =>{
            const element = document.getElementById(id);
            if (element) {
                element.addEventListener("click", () => loadContent(id));
            }
        });
    }
});