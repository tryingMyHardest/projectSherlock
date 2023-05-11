var editor0;
var editor1;
var editor2;

const createEditor = (fileName) => {
    let type = fileName.split(".");

    var root = document.getElementById(fileName);
    root.parentNode.insertBefore(root.cloneNode(true), root);
    root.setAttribute("style", "");
    root.setAttribute("id", 'editor');

    if(root.getAttribute('class')=='editor0'){
        editor0 = ace.edit(root);
        editor0.setTheme("ace/theme/idle_fingers");
        editor0.session.setMode("ace/mode/" + type[1]);
    }else if(root.getAttribute('class')=='editor1'){
        editor1 = ace.edit(root);
        editor1.setTheme("ace/theme/idle_fingers");
        editor1.session.setMode("ace/mode/" + type[1]);
    }else if(root.getAttribute('class')=='editor2'){
        editor2 = ace.edit(root);
        editor2.setTheme("ace/theme/idle_fingers");
        editor2.session.setMode("ace/mode/javascript");
    }
    
}
            
const deleteEditor = (file) => {

    let div = document.getElementById(file);

    if(div.getAttribute('class')=='editor0'){
        editor0.destroy();
        var el = editor0.container;
        el.parentNode.removeChild(el);
        editor0 = null;
    }else if(div.getAttribute('class')=='editor1'){
        editor1.destroy();
        var el = editor1.container;
        el.parentNode.removeChild(el);
        editor1 = null;
    }else if(div.getAttribute('class')=='editor2'){
        editor2.destroy();
        var el = editor2.container;
        el.parentNode.removeChild(el);
        editor2 = null;
    }
}

const changeTab = (button, file) => {
    // Declare all variables
    let name = button.getAttribute('class').split(' ');
    if(name[0]=='codeTab'){
        let codeTab = document.getElementsByClassName("codeTab");

        for (let i = 0; i < codeTab.length; i++) {
            codeTab[i].className = "codeTab";
        }
    }else{
        let codeTab = document.getElementsByClassName("codeTab1");

        for (let i = 0; i < codeTab.length; i++) {
            codeTab[i].className = "codeTab1";
        }
    }

    // Set clicked tab's class to "active"
    button.className += " active";

    // Check if editor is populated already. If yes, delete it & set object to null
    if(editor != null){
        deleteEditor(file);
    }

    // Create editor for tab with proper code file
    createEditor(file);
}

// Get button element
var button = document.querySelector(".top");

const nav = document.querySelector('nav');

let lastScrollY = window.scrollY;
let scrollAnchor = window.scrollY;

// Scroll window to top of the page
const scrollToTop = () => {
    window.scrollTo({top: 0});
}

// On scroll do something
window.onscroll = function () {handleScroll()};

const handleScroll = () => {
  if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
    // Show button
    button.classList.add("showBtn");
  } else {
    // Hide button
    button.classList.remove("showBtn");
  }

  if(lastScrollY < window.scrollY && lastScrollY > 0){
    nav.classList.add('hide-nav');
    scrollAnchor = window.scrollY;
  }else if(Math.abs(lastScrollY-scrollAnchor) > 100){
    nav.classList.remove('hide-nav');
  }

  lastScrollY = window.scrollY;
}

var names = ['Alexander_Holder', 'Alice_Rucastle',   'Alice_Turner',     'Arthur_Holder',    'Bradstreet',   'Breckinridge', 'Brigham_Young',    'Catherine Cusack', 'Charles_McCarthy', 'Clotilde_Lothman', 'Cowper',       'Enoch_J_Drebber',  'Ferrier',      'Flora_Millar', 'Francis_Moulton',  'George_Burnwell',  'Grimesby_Roylott', 'Helen_Stoner', 'Henry_Baker',  'Hosmer_Angel', 'Irene_Adler',   'Isa_Whitney',     'Jabez_Wilson', 'James_McCarthy', 'James_Ryder', 'James_Windibank', 'Jefferson_Hope', 'Jephro_Rucastle', 'John_Clay', 'John_Ferrier', 'John_Openshaw', 'John_Rance',    'John_Turner',  'John_Watson',  'Jones',        'Joseph_Smith', 'Joseph_Stangerson', 'Kate_Whitney', 'Lady_St_Simon', 'Lestrade',       'Lucy_Ferrier', 'Mary_Holder',  'Mary_Sutherland',  'Mary_Watson', 'Merryweather', 'Miss_Stoper', 'Mr_Fowler', 'Mrs_Hudson', 'Mrs_Moulton', 'Mrs_Oakshott', 'Mrs_Rucastle', 'Mrs_Sawyer',   'Mrs_St_Clair', 'Mrs_Toller', 'Mrs_Turner',     'Neville_St_Clair', 'Peterson',     'Robert_St_Simon', 'Sherlock_Holmes', 'Stamford',   'Tobias_Gregson', 'Unknown',    'Victor_Hatherley', 'Violet_Hunter', 'Wiggins',       'Wilhelm_Ormstein'];
var color = ['56, 252, 154',    '196, 192, 255',    '255, 192, 203',    '56, 105, 252',      '252, 252, 93', '115, 0, 255', '45, 128, 121',     '122, 89, 101',     '211, 255, 189',    '24, 92, 99',       '255, 0, 247','255, 255, 255',    '133, 182, 255',  '145, 52, 52',  '255, 168, 168',    '183, 151, 186',    '185, 252, 104',     '156, 100, 3','21, 128, 3',   '128, 3, 109',  '255, 165, 0',  '250, 57, 134',    '255, 212, 128','111, 130, 104',  '112, 91, 42', '65, 108, 120',    '94, 73, 117',    '235, 119, 117',   '0, 45, 128','138, 131, 72', '0, 255, 98', '229, 255, 0', '107, 140, 129','69, 69, 69',   '75, 72, 122',       '170, 0, 255',  '250, 0, 0',      '173, 49, 0',   '89, 107, 57',   '158, 157, 157',  '189, 255, 242','255, 189, 227','76, 175, 80',      '245, 83, 83',   '149, 186, 0',   '150, 54, 122','0, 72, 186','73, 84, 102','255, 0, 238', '255, 77, 118', '168, 40, 51',  '139, 255, 43','219, 176, 149','94, 65, 46', '123, 159, 179',  '108, 89, 128',     '133, 165, 255','110, 106, 0',     '0, 255, 255',     '176, 11, 49','191, 255, 196',  '13, 0, 255', '79, 160, 255',       '166, 0, 255',   '255, 212, 212', '171, 135, 255'];

const highlight = (check) => {
    var pos;
    var name = check.value;

    for(let i = 0; i < names.length; i++){
        if(names[i]==name){
            pos = i;
            break;
        }
    }

    if(!check.hasAttribute('id')){
        let quotes = document.getElementsByClassName(name);

        for(let i = 0; i < quotes.length; i++){
            if(!quotes[i].hasAttribute('style')){
                quotes[i].setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
            }else{
                quotes[i].removeAttribute('style');
            }
        }
    }else{
        let id = check.getAttribute('id').split('.');
        let chapter = document.getElementById(id[1]);

        for(const child of chapter.children) {
            for(const child2 of child.children){
                if(child2.getAttribute('class') == name){
                    if(!child2.hasAttribute('style')){
                        child2.setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
                    }else{
                        child2.removeAttribute('style');
                    }
                }
            }
        }
    }
}

const checkAll = (button) => {
    let element = button.parentElement.parentElement;
    var pos;

    let checks = element.getElementsByClassName('check');

    for(let i = 0; i < checks.length; i++){
        checks[i].checked = true;

        var name = checks[i].getAttribute('value');
        
        for(let t = 0; t < names.length; t++){
            if(names[t]==name){
                pos = t;
                break;
            }
        }

        if(!checks[i].hasAttribute('id')){
            let quotes = document.getElementsByClassName(name);

            for(let k = 0; k < quotes.length; k++){
    
                quotes[k].setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
            }
        }else{
            let id = checks[i].getAttribute('id').split('.');
            let chapter = document.getElementById(id[1]);

            for(const child of chapter.children) {
                for(const child2 of child.children){
                    if(child2.getAttribute('class') == name){
                        child2.setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
                    }
                }
            }
        }
        
    }
}

const unCheckAll = () => {

    let checks = document.getElementsByClassName("check");

    for(let i = 0; i < checks.length; i++){
        checks[i].checked = false;
    }

    let quotes = document.getElementsByTagName('span')

    for(let i = 0; i < quotes.length; i++){
        if(quotes[i].hasAttribute('style')){
            quotes[i].removeAttribute('style');
        }
    }
}

const center = () => {
    let element = document.getElementById('postText');

    setTimeout(scroll = () =>{
        element.scrollIntoView(true)
    }, 500);
}

const fitScreen = (button, graph) => {
    let element = document.getElementById('network-'+graph);
    let container = document.getElementById('section-'+graph);

    if(element.classList.contains('network-fullscreen')){
        console.log(container);
        container.classList.remove("scale");
        element.classList.remove('network-fullscreen');

        button.parentElement.classList.remove('tab-fullscreen');
        button.parentElement.parentElement.setAttribute('style', 'position:relative;');
        button.setAttribute('title', 'Fit Screen');
        button.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" id="unfold-more"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M12 5.83L15.17 9l1.41-1.41L12 3 7.41 7.59 8.83 9 12 5.83zm0 12.34L8.83 15l-1.41 1.41L12 21l4.59-4.59L15.17 15 12 18.17z"></path></svg>';
        
    }else{
        element.classList.add('network-fullscreen');
        container.classList.add("scale");
        element.scrollIntoView(true);

        button.parentElement.classList.add('tab-fullscreen');
        button.parentElement.parentElement.removeAttribute('style');
        button.setAttribute('title', 'Default View');
        button.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" id="unfold-less"><path fill="none" d="M24 0v24H0V0h24z" opacity=".87"></path><path d="M7.41 18.59L8.83 20 12 16.83 15.17 20l1.41-1.41L12 14l-4.59 4.59zm9.18-13.18L15.17 4 12 7.17 8.83 4 7.41 5.41 12 10l4.59-4.59z"></path></svg>';
        
    }
    
}

const fullScreen = (button, graph) => {
    let element = button.parentElement.parentElement;

    if(!document.fullscreenElement){
        element.requestFullscreen();
        button.setAttribute('title', 'Exit Full Screen');
        button.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" id="fullscreen-exit"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M5 16h3v3h2v-5H5v2zm3-8H5v2h5V5H8v3zm6 11h2v-3h3v-2h-5v5zm2-11V5h-2v5h5V8h-3z"></path></svg>';
    }else{
        document.exitFullscreen();
        button.setAttribute('title', 'Full Screen');
        button.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" id="fullscreen"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M7 14H5v5h5v-2H7v-3zm-2-4h2V7h3V5H5v5zm12 7h-3v2h5v-5h-2v3zM14 5v2h3v3h2V5h-5z"></path></svg>';
    }

    let div = document.getElementById('network-'+graph);
    let container = document.getElementById('section-'+graph);

    if(div.classList.contains('network-fullscreen')){
        div.classList.remove('network-fullscreen');
        container.classList.remove("scale");
        button.parentElement.parentElement.setAttribute('style', 'position:relative;');
        document.getElementById('fit-'+graph).innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" id="unfold-more"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M12 5.83L15.17 9l1.41-1.41L12 3 7.41 7.59 8.83 9 12 5.83zm0 12.34L8.83 15l-1.41 1.41L12 21l4.59-4.59L15.17 15 12 18.17z"></path></svg>';
    }
}

var isOpen = false;
var navOpen = false;

const change = () => {
    let el = document.getElementById("menu");
    let body = document.getElementById('site');

        if(isOpen){
            el.classList.remove("in-screen");
            setTimeout(() => {
                el.classList.remove("visible")}, 300);
            body.classList.remove("lock-screen");
            isOpen = false;
        }else{
            el.classList.add("visible");
            setTimeout(() => {
                el.classList.add("in-screen")}, 5);
            body.classList.add('lock-screen');
            isOpen = true;
        }
}

const openNav = () => {
    let el = document.getElementById("nav");
    let body = document.getElementById('site');
    let arrow = document.getElementById('arrow');


    if(navOpen){
        el.classList.remove("nav-in-screen");
        body.classList.remove("lock-screen");
        arrow.classList.remove("reverse-arrow");
        navOpen = false;
    }else{
        el.classList.add("nav-in-screen");
        body.classList.add('lock-screen');
        arrow.classList.add("reverse-arrow");
        navOpen = true;
    }
}

visualViewport.addEventListener('resize', function () {resizeScreen();});


const resizeScreen = () => {
    let width = visualViewport.width;
    let details = document.getElementsByClassName("expand-code");

    if(width > 1010){
        if(details != null){
            if(!details[0].hasAttribute('open')){
                for(let i = 0; i < details.length; i++){
                    details[i].setAttribute('open', true);
                }
            }
        }
    }else{
        if(details != null){
            for(let i = 0; i < details.length; i++){
                details[i].removeAttribute('open');
            }
        }
    }

    if(width > 1010 && isOpen){
        change();
    }else if(width > 1010 && navOpen){
        openNav();
    }

}

document.addEventListener('click', function(event) {
    let menu = this.getElementById("menu");
    let burger = this.getElementById("burger");
    let nav = this.getElementById('nav');
    let arrow = this.getElementById('arrow');

    let outSideMenu = !menu.contains(event.target);
    let outSideBurger = !burger.contains(event.target);
    if(nav != null){
        outSideNav = !nav.contains(event.target);
        outSideArrow = !arrow.contains(event.target);
    }

    if(isOpen){
        if(outSideMenu && outSideBurger){
            change();
        }
    }else if(navOpen){
        if(outSideArrow && outSideNav){
            openNav();
        }
    }
  }); 