import { Albums, Artists, GoActivation, Home, Login, Registration, Tracks, User } from "@/pages";

export enum PrivateRoutes {
  HOME = '/',
  TRACKS = '/tracks',
  CREATE_TRACK = '/tracks/create',
  ALBUMS = '/albums',
  ARTISTS = '/artists',
  USER = '/user/:id',
  NOT_FOUND = "*"
}

export enum PublicRoutes {
  LOGIN = '/',
  REGISTRATION = '/registration',
  ACTIVATION = '/activate/:activationLink', 
  NOT_FOUND = "*"
}

export const privateRoutes =[
  {path: PrivateRoutes.HOME, component: Home, exact:true},
  {path: PrivateRoutes.TRACKS, component: Tracks, exact:true},
  // {path: PrivateRoutes.CREATE_TRACK, component: CreateTrack, exact:true},
  {path: PrivateRoutes.ALBUMS, component: Albums, exact:true},
  {path: PrivateRoutes.ARTISTS, component: Artists, exact:true},
  {path: PrivateRoutes.USER, component: User, exact:true},
  {path: PrivateRoutes.NOT_FOUND, component: Home, exact:true},
]


export const publicRoutes = [
  { path: PublicRoutes.LOGIN, component: Login, exact: true },
  { path: PublicRoutes.REGISTRATION, component: Registration, exact: true },
  { path: PublicRoutes.ACTIVATION, component: GoActivation, exact: true },
  { path: PublicRoutes.NOT_FOUND, component: Login, exact: true },
];