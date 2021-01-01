import React from 'react';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import ListSubheader from '@material-ui/core/ListSubheader';
import DashboardIcon from '@material-ui/icons/Dashboard';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import PeopleIcon from '@material-ui/icons/People';
import BarChartIcon from '@material-ui/icons/BarChart';
import LayersIcon from '@material-ui/icons/Layers';
import AssignmentIcon from '@material-ui/icons/Assignment';
import EventIcon from '@material-ui/icons/Event';
import EmojiPeople from '@material-ui/icons/EmojiPeople';
import {
  BrowserRouter as Router,
  Link,
  NavLink
} from "react-router-dom";
export const mainListItems = (
  <div>
    <NavLink to="/user" style={{ textDecoration: 'none' }}>
    <ListItem button>
      <ListItemIcon>
        <DashboardIcon />
      </ListItemIcon>
      <ListItemText primary="Inicio" />
    </ListItem>
    </NavLink>
<Link to="/about" style={{ textDecoration: 'none' }}>
    <ListItem button>
      <ListItemIcon>
        <EventIcon />
      </ListItemIcon>
      
      <ListItemText primary="Eventos">
      </ListItemText>
      
      
    </ListItem>
</Link>

    <ListItem button>
      <ListItemIcon>
        <EmojiPeople />
      </ListItemIcon>
      <ListItemText primary="Participantes" />
    </ListItem>
    <ListItem button>
      <ListItemIcon>
        <PeopleIcon />
      </ListItemIcon>
      <ListItemText primary="Organizadores" />
    </ListItem>
    <ListItem button>
      <ListItemIcon>
        <PeopleIcon />
      </ListItemIcon>
      <ListItemText primary="Usuarios" />
    </ListItem>
  </div>
);

export const secondaryListItems = (
  <div>
    <ListSubheader inset>Accesos Rapidos</ListSubheader>
    <ListItem button>
      <ListItemIcon>
        <AssignmentIcon />
      </ListItemIcon>
      <ListItemText primary="Proximos eventos" />
    </ListItem>
    <ListItem button>
      <ListItemIcon>
        <AssignmentIcon />
      </ListItemIcon>
      <ListItemText primary="Estadisticas" />
    </ListItem>
    <ListItem button>
      <ListItemIcon>
        <AssignmentIcon />
      </ListItemIcon>
      <ListItemText primary="Acerca de" />
    </ListItem>
  </div>
);