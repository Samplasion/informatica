const annotClass = '.comment-code-annotation';
const commentClasses = ".c, .cm, .c1, .cp, .cs";
document.addEventListener("DOMContentLoaded", () => {
    if (typeof annotations != 'object' || Object.keys(annotations).length < 1) {
        console.log("No annotations found. Skipping...");
        return;
    }

    function refresh(what) {
        console.log(tippy(what, {
            allowHTML: true,
            trigger: 'click',
            theme: 'light',
            interactive: true,
            appendTo: () => document.body,
            onMount(instance) {
                refresh(instance.popper.querySelectorAll(annotClass));
            },
            onHidden(instance) {
                const tippies = instance.popper.querySelectorAll(annotClass);
                if (tippies.length) {
                    console.log(`Destroying ${tippies.length} tippies...`);
                    console.debug(tippies);
                    
                    tippies.forEach(el => el._tippy.destroy());
                }
            },
        }));
    }
    function trimAnnotations(element) {
        // Remove the comment around if it only consists of the button
        const textNodes = Array.from(element.childNodes).filter(n => n.nodeName == "#text");
        const itHasNonTextNodes = Array.from(element.childNodes).filter(n => n.nodeName != "#text").length > 0;
        const allTextNodesAreUseless = textNodes.every(node => /^\s*([\/#\*]{2,3})?\s*$/.test(`${node.nodeValue}`));
        if (itHasNonTextNodes && allTextNodesAreUseless) {
            textNodes.forEach(node => element.removeChild(node));
        }
    }

    /** @param {Element} element */
    function addAnnotations(element) {
        element.innerHTML = element.innerHTML.replace(/\(\+([^)]+)\)/g, (s, id) => {
            let annotationElement;
            if (id in annotations) {
                let element = buildAnnotation(id, annotations[id].trim());
                element.querySelectorAll(commentClasses).forEach(addAnnotations);
                annotationElement = element;
            } else {
                annotationElement = document.createTextNode(s);
            };
            return annotationElement.outerHTML;
        });

        trimAnnotations(element);
    }
    function buildAnnotation(id, content) {
        const button = document.createElement("button");
        button.classList.add(annotClass.substring(1));
        button.id = `code-annotation-${id}`;
        button.innerText = "+";

        let element = document.createElement("div");
        element.classList.add("no-code-header");
        element.innerHTML = content;

        addAnnotations(element);

        button.setAttribute("data-tippy-content", element.outerHTML);
    
        return button;
    }

    document.querySelectorAll(commentClasses).forEach(addAnnotations);

    refresh(annotClass);
});