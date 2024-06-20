function loadEntries(){
    fetch('https://api.webdirectory.core/entries')
        .then(response => response.json())
        .then(data => {
            const listContainer = document.getElementById('entry-list');
            listContainer.innerHTML = data.map(entry => `
                <div class="entry" onclick="showEntryDetails(${entry.id})">
                    <p>${entry.nom} ${entry.prenom}</p>
                    <p>${entry.service}</p>
                </div>
            `).join('');       
        })
        .catch(error => console.error('Erreur : ', error));
}

function filterAndSearchEntries(){
    const service = document.getElementById('serviceFilter').value;
    const name = document.getElementById('searchInput').value;

    fetch('https://api.webdirectory.core/entries')
        .then(response => response.json())
        .then(data => {
            const filterdData = data.filter(entry =>{
                return (service === '' || entry.service === service) &&
                    (name === '' || entry.nom.includes(name));
            });

            const listContainer = document.getElementById('entry-list');
            listContainer.innerHTML = filteredData.map(entry => `
                <div class="entry" onclick="showEntryDetails(${entry.id})">
                    <p>${entry.nom} ${entry.prenom}</p>
                    <p>${entry.service}</p>
                </div>
            `).join('');
        })
        .catch(error => console.error('Erreur : ', error));
}

function showEntryDetails(entryId){
    fetch(`https://api.webdirectory.core/e,tries/${entryId}`)
        .then(response => response.json())
        .then(data => {
            const detailContainer = document.getElementById('entry-detail');
            let imageHtml = data.image ? `<img src="${data.image}" alt="Image de ${data.nom}">` : '';
            detailContainer.innerHTML = `
                <h2>${data.nom} ${data.prenom}</h2>
                ${imageHtml}
                <p>Service : ${data.service}</p>
                <p>Email : <a href="mailto:${data.email}">${data.email}</a></p>
                <p>${data.description}</p
                `;
        })
        .catch(error => console.error('Erreur : ', error));
}

document.addEventListener('DOMContentLoaded', loadEntries);