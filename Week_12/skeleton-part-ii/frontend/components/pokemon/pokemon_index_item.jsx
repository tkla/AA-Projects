import React from 'react'

const PokemonIndexItem = ({pokemon}) => {
    return (
        <li className = "pokemon-index-item">
            <h3>{pokemon.name}</h3>
            <img src = {pokemon.imageUrl}/>
        </li>
    )
}

export default PokemonIndexItem